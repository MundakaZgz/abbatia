-- ============================================================
-- 011_edificio_tipo_descripcion_compat.sql
-- Compatibilidad para consultas de adEdificio que usan et.DESCRIPCION
-- ============================================================
SET NAMES utf8;

SET @schema_name = DATABASE();

SET @col_exists = (
  SELECT COUNT(*)
  FROM information_schema.columns
  WHERE table_schema = @schema_name
    AND table_name = 'edificio_tipo'
    AND column_name = 'descripcion'
);

SET @sql = IF(
  @col_exists = 0,
  'ALTER TABLE edificio_tipo ADD COLUMN descripcion BIGINT NULL AFTER nombre',
  'SELECT 1'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- En el modelo legacy, descripcion es literalid para joins con literales.
UPDATE edificio_tipo
SET descripcion = COALESCE(descripcion, nombre)
WHERE descripcion IS NULL;