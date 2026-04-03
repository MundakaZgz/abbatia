-- ============================================================
-- 015_correos_inbox_compat.sql
-- Compatibilidad para epistolario (inbox/outbox)
-- ============================================================
SET NAMES utf8;

SET @schema_name = DATABASE();

-- Columnas requeridas por adCorreo
SET @col_exists = (
  SELECT COUNT(*)
  FROM information_schema.columns
  WHERE table_schema = @schema_name
    AND table_name = 'correo'
    AND column_name = 'mensaje'
);
SET @sql = IF(
  @col_exists = 0,
  'ALTER TABLE correo ADD COLUMN mensaje TEXT NULL AFTER abadiaid',
  'SELECT 1'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists = (
  SELECT COUNT(*)
  FROM information_schema.columns
  WHERE table_schema = @schema_name
    AND table_name = 'correo'
    AND column_name = 'fecha_abadia'
);
SET @sql = IF(
  @col_exists = 0,
  'ALTER TABLE correo ADD COLUMN fecha_abadia DATETIME NULL AFTER mensaje',
  'SELECT 1'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists = (
  SELECT COUNT(*)
  FROM information_schema.columns
  WHERE table_schema = @schema_name
    AND table_name = 'correo'
    AND column_name = 'fecha_real'
);
SET @sql = IF(
  @col_exists = 0,
  'ALTER TABLE correo ADD COLUMN fecha_real DATETIME NULL AFTER fecha_abadia',
  'SELECT 1'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- Corregir correoid null para joins con correo_destinatario
UPDATE correo
SET correoid = _pk
WHERE correoid IS NULL OR correoid = 0;

-- Fechas por defecto para filas legacy
UPDATE correo
SET fecha_abadia = COALESCE(fecha_abadia, NOW()),
    fecha_real = COALESCE(fecha_real, NOW())
WHERE fecha_abadia IS NULL OR fecha_real IS NULL;

SET @idx_exists = (
  SELECT COUNT(*)
  FROM information_schema.statistics
  WHERE table_schema = @schema_name
    AND table_name = 'correo'
    AND index_name = 'idx_correo_correoid'
);
SET @sql = IF(
  @idx_exists = 0,
  'CREATE INDEX idx_correo_correoid ON correo (correoid)',
  'SELECT 1'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @idx_exists = (
  SELECT COUNT(*)
  FROM information_schema.statistics
  WHERE table_schema = @schema_name
    AND table_name = 'correo_destinatario'
    AND index_name = 'idx_correo_destinatario_correoid'
);
SET @sql = IF(
  @idx_exists = 0,
  'CREATE INDEX idx_correo_destinatario_correoid ON correo_destinatario (correoid)',
  'SELECT 1'
);
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- Trigger para mantener correoid funcional en nuevos inserts legacy
DROP TRIGGER IF EXISTS ai_correo_set_correoid;
DELIMITER $$
CREATE TRIGGER ai_correo_set_correoid
AFTER INSERT ON correo
FOR EACH ROW
BEGIN
  IF NEW.correoid IS NULL OR NEW.correoid = 0 THEN
    UPDATE correo
       SET correoid = NEW._pk
     WHERE _pk = NEW._pk;
  END IF;
END$$
DELIMITER ;
