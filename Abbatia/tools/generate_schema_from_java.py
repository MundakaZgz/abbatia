#!/usr/bin/env python3
import re
from pathlib import Path
from collections import defaultdict

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "src" / "main" / "java"
OUT_SCHEMA = ROOT / "db" / "init" / "001_schema_from_code.sql"
OUT_ROUTINES = ROOT / "db" / "init" / "002_routines_stubs.sql"

LITERAL_RE = re.compile(r'"(?:\\.|[^"\\])*"', re.S)
IDENT = r"[A-Za-z_][A-Za-z0-9_]*"


def java_unescape(s: str) -> str:
    s = s[1:-1]
    s = s.replace(r"\n", " ").replace(r"\r", " ").replace(r"\t", " ")
    s = s.replace(r'\"', '"').replace(r"\\'", "'")
    s = s.replace(r"\\\\", "\\")
    return s


def normalize_sql(s: str) -> str:
    return re.sub(r"\s+", " ", s).strip()


def sqlish(s: str) -> bool:
    low = s.lower()
    return any(k in low for k in ["select ", "insert into ", "update ", "delete from ", " call ", "call "])


def split_csv(expr: str):
    parts = []
    cur = []
    depth = 0
    for ch in expr:
        if ch == '(':
            depth += 1
        elif ch == ')' and depth > 0:
            depth -= 1
        if ch == ',' and depth == 0:
            p = ''.join(cur).strip()
            if p:
                parts.append(p)
            cur = []
        else:
            cur.append(ch)
    tail = ''.join(cur).strip()
    if tail:
        parts.append(tail)
    return parts


def clean_ident(x: str) -> str:
    return x.strip().strip('`').strip().lower()


def infer_type(col: str) -> str:
    c = col.lower()
    if c == "id" or c.endswith("id") or c.startswith("id"):
        return "BIGINT"
    if any(k in c for k in ["fecha", "hora", "timestamp"]):
        return "DATETIME"
    if any(k in c for k in ["precio", "importe", "coste", "valor", "ratio", "porcentaje"]):
        return "DOUBLE"
    if any(k in c for k in ["activo", "bloqueado", "conectado", "acepta", "permite", "habilitado", "visible"]):
        return "TINYINT(1)"
    if any(k in c for k in ["cantidad", "num", "numero", "nivel", "edad", "orden", "dias", "horas", "min", "max", "puntos", "turno", "region"]):
        return "INT"
    if any(k in c for k in ["descripcion", "texto", "detalle", "mensaje", "html", "observa"]):
        return "TEXT"
    return "VARCHAR(255)"


def extract_from_clause(sql: str):
    aliases = {}
    m = re.search(r"\bfrom\b\s+(.+?)(\bwhere\b|\bgroup\b|\border\b|\bhaving\b|\blimit\b|$)", sql, flags=re.I)
    if not m:
        return aliases
    fragment = m.group(1)
    # normalize joins as commas for parsing
    fragment = re.sub(r"\b(left|right|inner|outer|cross)?\s*join\b", ",", fragment, flags=re.I)
    for part in split_csv(fragment):
        part = part.strip()
        if not part:
            continue
        part = re.split(r"\bon\b", part, flags=re.I)[0].strip()
        tokens = [t for t in re.split(r"\s+", part) if t]
        if not tokens:
            continue
        table = clean_ident(tokens[0])
        if len(tokens) >= 3 and tokens[1].lower() == "as":
            alias = clean_ident(tokens[2])
        elif len(tokens) >= 2:
            alias = clean_ident(tokens[1])
        else:
            alias = table
        if re.match(f"^{IDENT}$", table):
            aliases[alias] = table
            aliases[table] = table
    return aliases


def add_col(tables, table: str, col: str):
    table = clean_ident(table)
    col = clean_ident(col)
    if not table or not col:
        return
    if not re.match(f"^{IDENT}$", table):
        return
    if not re.match(f"^{IDENT}$", col):
        return
    if col.lower() in {"and", "or", "null", "true", "false", "asc", "desc"}:
        return
    tables[table].add(col)


def parse_sql(sql: str, tables, routines):
    s = normalize_sql(sql)
    low = s.lower()

    for m in re.finditer(r"\bcall\s+([A-Za-z_][A-Za-z0-9_]*)\s*\(([^)]*)\)", s, flags=re.I):
        name = clean_ident(m.group(1))
        args = m.group(2).strip()
        argc = 0 if not args else len([x for x in args.split(",") if x.strip()])
        routines[name].add(argc)

    # INSERT
    m = re.search(r"\binsert\s+into\s+(`?" + IDENT + r"`?)\s*\((.*?)\)\s*values", s, flags=re.I)
    if m:
        table = clean_ident(m.group(1))
        for col in split_csv(m.group(2)):
            add_col(tables, table, col)
        return

    # UPDATE
    m = re.search(r"\bupdate\s+(`?" + IDENT + r"`?)\s+set\s+(.+?)(\bwhere\b|$)", s, flags=re.I)
    if m:
        table = clean_ident(m.group(1))
        for asg in split_csv(m.group(2)):
            if "=" in asg:
                add_col(tables, table, asg.split("=", 1)[0])
        return

    # DELETE
    m = re.search(r"\bdelete\s+from\s+(`?" + IDENT + r"`?)", s, flags=re.I)
    if m:
        table = clean_ident(m.group(1))
        add_col(tables, table, "id")

    # SELECT
    m = re.search(r"\bselect\b\s+(.+?)\s+\bfrom\b\s+", s, flags=re.I)
    aliases = extract_from_clause(s)
    for table in sorted({v for v in aliases.values()}):
        tables[table]

    if m:
        projection = m.group(1).strip()
        if projection != "*":
            for item in split_csv(projection):
                item = item.strip()
                if re.search(r"\bas\b", item, flags=re.I):
                    item = re.split(r"\bas\b", item, flags=re.I)[0].strip()
                item = re.sub(r"^[A-Za-z_][A-Za-z0-9_]*\((.*)\)$", r"\1", item)
                q = re.match(r"(`?" + IDENT + r"`?)\.(`?" + IDENT + r"`?)$", item)
                if q:
                    alias, col = clean_ident(q.group(1)), clean_ident(q.group(2))
                    table = aliases.get(alias)
                    if table:
                        add_col(tables, table, col)
                elif re.match(r"^`?" + IDENT + r"`?$", item):
                    col = clean_ident(item)
                    # if only one table in FROM, assign it
                    real_tables = sorted({v for v in aliases.values()})
                    if len(real_tables) == 1:
                        add_col(tables, real_tables[0], col)

    # columns in predicates alias.col
    for q in re.finditer(r"\b(`?" + IDENT + r"`?)\.(`?" + IDENT + r"`?)\b", s):
        alias, col = clean_ident(q.group(1)), clean_ident(q.group(2))
        table = aliases.get(alias)
        if table:
            add_col(tables, table, col)


def gather_sql_strings(text: str):
    lits = [java_unescape(m.group(0)) for m in LITERAL_RE.finditer(text)]
    return [normalize_sql(x) for x in lits if sqlish(x)]


def main():
    tables = defaultdict(set)
    routines = defaultdict(set)

    for fp in SRC.rglob("*.java"):
        try:
            text = fp.read_text(encoding="latin-1", errors="ignore")
        except Exception:
            continue

        for m in re.finditer(r"call\s+([A-Za-z_][A-Za-z0-9_]*)\s*\(([^)]*)\)", text, flags=re.I):
            name = clean_ident(m.group(1))
            args = m.group(2).strip()
            argc = 0 if not args else len([x for x in args.split(",") if x.strip()])
            routines[name].add(argc)

        for sql in gather_sql_strings(text):
            parse_sql(sql, tables, routines)

    OUT_SCHEMA.parent.mkdir(parents=True, exist_ok=True)

    lines = []
    lines.append("-- Auto-generado desde SQL embebido en Java")
    lines.append("-- IMPORTANTE: esquema base para arrancar; hay que refinar tipos/FKs/índices")
    lines.append("SET NAMES utf8;")
    lines.append("")

    for table in sorted(tables):
        cols = sorted(tables[table], key=lambda c: (0 if c.lower().endswith("id") else 1, c.lower()))
        lines.append(f"CREATE TABLE IF NOT EXISTS `{table}` (")
        body = ["  `_pk` BIGINT NOT NULL AUTO_INCREMENT"]
        for col in cols:
            body.append(f"  `{col}` {infer_type(col)} NULL")
        body.append("  PRIMARY KEY (`_pk`)")
        lines.append(",\n".join(body))
        lines.append(") ENGINE=InnoDB DEFAULT CHARSET=utf8;")
        lines.append("")

    OUT_SCHEMA.write_text("\n".join(lines), encoding="utf-8")

    rlines = []
    rlines.append("-- Stubs de rutinas llamadas desde Java")
    rlines.append("-- Devuelven datasets vacíos/minimales para permitir arranque inicial")
    rlines.append("DELIMITER $$")
    rlines.append("")
    for r in sorted(routines):
        argc = max(routines[r]) if routines[r] else 0
        params = ", ".join([f"IN p{i} VARCHAR(255)" for i in range(1, argc + 1)])
        rlines.append(f"DROP PROCEDURE IF EXISTS `{r}`$$")
        rlines.append(f"CREATE PROCEDURE `{r}`({params})")
        rlines.append("BEGIN")
        rlines.append("  SELECT 0 AS id, '' AS descripcion LIMIT 0;")
        rlines.append("END$$")
        rlines.append("")
    rlines.append("DELIMITER ;")
    OUT_ROUTINES.write_text("\n".join(rlines), encoding="utf-8")

    print(f"Tablas inferidas: {len(tables)}")
    print(f"Rutinas detectadas: {len(routines)}")
    print(f"Esquema: {OUT_SCHEMA}")
    print(f"Rutinas: {OUT_ROUTINES}")


if __name__ == "__main__":
    main()
