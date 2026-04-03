-- ============================================================
-- 017_mercado_alimentos_familia_compat.sql
-- Compatibilidad mercado venta: adMercadoVenta.getProductos
-- espera alimentos_familia.descripcion
-- ============================================================
SET NAMES utf8;

SET @db_name = DATABASE();

SET @sql_stmt = (
  SELECT IF(
    EXISTS (
      SELECT 1
      FROM information_schema.columns
      WHERE table_schema = @db_name
        AND table_name = 'alimentos_familia'
        AND column_name = 'descripcion'
    ),
    'SELECT 1',
    'ALTER TABLE alimentos_familia ADD COLUMN descripcion TEXT NULL AFTER literalid'
  )
);
PREPARE stmt FROM @sql_stmt;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Rellena descripcion desde literales (idioma castellano) cuando este vacia.
UPDATE alimentos_familia af
LEFT JOIN literales l
  ON l.literalid = af.literalid
 AND l.idiomaid = 1
SET af.descripcion = COALESCE(NULLIF(TRIM(l.literal), ''), af.descripcion)
WHERE af.descripcion IS NULL
   OR TRIM(af.descripcion) = '';
