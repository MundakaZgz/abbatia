-- ============================================================
-- 014_salario_guardias_compat.sql
-- Compatibilidad para modulo de guardias / salarios
-- ============================================================
SET NAMES utf8;

SET @schema_name = DATABASE();

-- salario.salarioid es usado por adSalarios.recuperarSalario
SET @col_exists = (
  SELECT COUNT(*)
  FROM information_schema.columns
  WHERE table_schema = @schema_name
    AND table_name = 'salario'
    AND column_name = 'salarioid'
);

SET @sql = IF(
  @col_exists = 0,
  'ALTER TABLE salario ADD COLUMN salarioid BIGINT NULL AFTER _pk',
  'SELECT 1'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Mapear filas legacy a salarioid funcional
UPDATE salario
SET salarioid = _pk
WHERE salarioid IS NULL OR salarioid = 0;

SET @idx_exists = (
  SELECT COUNT(*)
  FROM information_schema.statistics
  WHERE table_schema = @schema_name
    AND table_name = 'salario'
    AND index_name = 'idx_salario_salarioid'
);

SET @sql = IF(
  @idx_exists = 0,
  'CREATE INDEX idx_salario_salarioid ON salario (salarioid)',
  'SELECT 1'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Seed minimo para tipos de empleado esperados por Constantes
INSERT INTO salario (salarioid, monedas)
SELECT 1, '100'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM salario WHERE salarioid = 1);

INSERT INTO salario (salarioid, monedas)
SELECT 2, '120'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM salario WHERE salarioid = 2);

INSERT INTO salario (salarioid, monedas)
SELECT 3, '120'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM salario WHERE salarioid = 3);
