-- ============================================================
-- 013_edificio_graficos_compat.sql
-- Normaliza grafico_1/grafico_2 de edificio_tipo para JSP legacy
-- ============================================================
SET NAMES utf8;

-- En JSP se compone: /images/mapas/<grafico>_<nivel>.gif
-- Por eso grafico_* debe ser basename (sin _n, sin .gif).

UPDATE edificio_tipo
SET grafico_1 = 'claustro',
    grafico_2 = 'claustro'
WHERE tipoedificioid = 2
  AND (grafico_1 LIKE '%.gif%' OR grafico_2 LIKE '%.gif%' OR grafico_1 REGEXP '^[0-9_]+$' OR grafico_2 REGEXP '^[0-9_]+$');

UPDATE edificio_tipo
SET grafico_1 = 'dormitorio',
    grafico_2 = 'dormitorio'
WHERE tipoedificioid = 3
  AND (grafico_1 LIKE '%.gif%' OR grafico_2 LIKE '%.gif%' OR grafico_1 REGEXP '^[0-9_]+$' OR grafico_2 REGEXP '^[0-9_]+$');

UPDATE edificio_tipo
SET grafico_1 = 'comedor',
    grafico_2 = 'comedor'
WHERE tipoedificioid = 4
  AND (grafico_1 LIKE '%.gif%' OR grafico_2 LIKE '%.gif%' OR grafico_1 REGEXP '^[0-9_]+$' OR grafico_2 REGEXP '^[0-9_]+$');

UPDATE edificio_tipo
SET grafico_1 = 'cocina',
    grafico_2 = 'cocina'
WHERE tipoedificioid = 5
  AND (grafico_1 LIKE '%.gif%' OR grafico_2 LIKE '%.gif%' OR grafico_1 REGEXP '^[0-9_]+$' OR grafico_2 REGEXP '^[0-9_]+$');

UPDATE edificio_tipo
SET grafico_1 = 'biblioteca',
    grafico_2 = 'biblioteca'
WHERE tipoedificioid = 6
  AND (grafico_1 LIKE '%.gif%' OR grafico_2 LIKE '%.gif%' OR grafico_1 REGEXP '^[0-9_]+$' OR grafico_2 REGEXP '^[0-9_]+$');

UPDATE edificio_tipo
SET grafico_1 = 'granja',
    grafico_2 = 'granja'
WHERE tipoedificioid = 7
  AND (grafico_1 LIKE '%.gif%' OR grafico_2 LIKE '%.gif%' OR grafico_1 REGEXP '^[0-9_]+$' OR grafico_2 REGEXP '^[0-9_]+$');

UPDATE edificio_tipo
SET grafico_1 = 'granero',
    grafico_2 = 'granero'
WHERE tipoedificioid = 8
  AND (grafico_1 LIKE '%.gif%' OR grafico_2 LIKE '%.gif%' OR grafico_1 REGEXP '^[0-9_]+$' OR grafico_2 REGEXP '^[0-9_]+$');

UPDATE edificio_tipo
SET grafico_1 = 'artesania',
    grafico_2 = 'artesania'
WHERE tipoedificioid = 11
  AND (grafico_1 LIKE '%.gif%' OR grafico_2 LIKE '%.gif%' OR grafico_1 REGEXP '^[0-9_]+$' OR grafico_2 REGEXP '^[0-9_]+$');

UPDATE edificio_tipo
SET grafico_1 = 'almacen',
    grafico_2 = 'almacen'
WHERE tipoedificioid = 12
  AND (grafico_1 LIKE '%.gif%' OR grafico_2 LIKE '%.gif%' OR grafico_1 REGEXP '^[0-9_]+$' OR grafico_2 REGEXP '^[0-9_]+$');

UPDATE edificio_tipo
SET grafico_1 = 'huerta',
    grafico_2 = 'huerta'
WHERE tipoedificioid = 23
  AND (grafico_1 LIKE '%.gif%' OR grafico_2 LIKE '%.gif%' OR grafico_1 REGEXP '^[0-9_]+$' OR grafico_2 REGEXP '^[0-9_]+$');

UPDATE edificio_tipo
SET grafico_1 = 'iglesia',
    grafico_2 = 'iglesia'
WHERE tipoedificioid = 24
  AND (grafico_1 LIKE '%.gif%' OR grafico_2 LIKE '%.gif%' OR grafico_1 REGEXP '^[0-9_]+$' OR grafico_2 REGEXP '^[0-9_]+$');

UPDATE edificio_tipo
SET grafico_1 = 'mercado',
    grafico_2 = 'mercado'
WHERE tipoedificioid = 25
  AND (grafico_1 LIKE '%.gif%' OR grafico_2 LIKE '%.gif%' OR grafico_1 REGEXP '^[0-9_]+$' OR grafico_2 REGEXP '^[0-9_]+$');

-- Tipo 99 (Abadia): fallback a familia generica edificio_*.gif
UPDATE edificio_tipo
SET grafico_1 = 'edificio',
    grafico_2 = 'edificio'
WHERE tipoedificioid = 99
  AND (grafico_1 LIKE '%.gif%' OR grafico_2 LIKE '%.gif%' OR grafico_1 REGEXP '^[0-9_]+$' OR grafico_2 REGEXP '^[0-9_]+$');
