-- ============================================================
-- 016_solicitudes_compat.sql
-- Compatibilidad para modulo de solicitudes
-- ============================================================
SET NAMES utf8;

SET @schema_name = DATABASE();

-- ------------------------------------------------------------
-- solicitud: columnas usadas por adSolicitudes
-- ------------------------------------------------------------
SET @col_exists = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema = @schema_name AND table_name = 'solicitud' AND column_name = 'abadiaid'
);
SET @sql = IF(@col_exists = 0,
  'ALTER TABLE solicitud ADD COLUMN abadiaid BIGINT NULL AFTER solicitudid',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema = @schema_name AND table_name = 'solicitud' AND column_name = 'monjeid'
);
SET @sql = IF(@col_exists = 0,
  'ALTER TABLE solicitud ADD COLUMN monjeid BIGINT NULL AFTER abadiaid',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema = @schema_name AND table_name = 'solicitud' AND column_name = 'fecha_creacion'
);
SET @sql = IF(@col_exists = 0,
  'ALTER TABLE solicitud ADD COLUMN fecha_creacion DATETIME NULL AFTER monjeid',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema = @schema_name AND table_name = 'solicitud' AND column_name = 'tiposolicitudid'
);
SET @sql = IF(@col_exists = 0,
  'ALTER TABLE solicitud ADD COLUMN tiposolicitudid BIGINT NULL AFTER estado',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema = @schema_name AND table_name = 'solicitud' AND column_name = 'texto'
);
SET @sql = IF(@col_exists = 0,
  'ALTER TABLE solicitud ADD COLUMN texto TEXT NULL AFTER tiposolicitudid',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- Mantener solicitudid funcional para joins con solicitud_voto
UPDATE solicitud
SET solicitudid = _pk
WHERE solicitudid IS NULL OR solicitudid = 0;

SET @idx_exists = (
  SELECT COUNT(*) FROM information_schema.statistics
  WHERE table_schema = @schema_name AND table_name = 'solicitud' AND index_name = 'idx_solicitud_solicitudid'
);
SET @sql = IF(@idx_exists = 0,
  'CREATE INDEX idx_solicitud_solicitudid ON solicitud (solicitudid)',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @idx_exists = (
  SELECT COUNT(*) FROM information_schema.statistics
  WHERE table_schema = @schema_name AND table_name = 'solicitud_voto' AND index_name = 'idx_solicitud_voto_solicitud_abadia'
);
SET @sql = IF(@idx_exists = 0,
  'CREATE INDEX idx_solicitud_voto_solicitud_abadia ON solicitud_voto (solicitudid, abadiaid)',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- Trigger para inserts legacy donde solicitudid no se informa
DROP TRIGGER IF EXISTS ai_solicitud_set_solicitudid;
DELIMITER $$
CREATE TRIGGER ai_solicitud_set_solicitudid
AFTER INSERT ON solicitud
FOR EACH ROW
BEGIN
  IF NEW.solicitudid IS NULL OR NEW.solicitudid = 0 THEN
    UPDATE solicitud
       SET solicitudid = NEW._pk
     WHERE _pk = NEW._pk;
  END IF;
END$$
DELIMITER ;

-- ------------------------------------------------------------
-- solicitud_tipo: catalogo requerido por joins
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS solicitud_tipo (
  _pk BIGINT NOT NULL AUTO_INCREMENT,
  tiposolicitudid BIGINT NULL,
  votos INT NULL,
  vigencia INT NULL,
  defecto INT NULL,
  literalid_si BIGINT NULL,
  literalid_no BIGINT NULL,
  accion VARCHAR(255) NULL,
  PRIMARY KEY (_pk)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET @idx_exists = (
  SELECT COUNT(*) FROM information_schema.statistics
  WHERE table_schema = @schema_name AND table_name = 'solicitud_tipo' AND index_name = 'idx_solicitud_tipo_id'
);
SET @sql = IF(@idx_exists = 0,
  'CREATE INDEX idx_solicitud_tipo_id ON solicitud_tipo (tiposolicitudid)',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

INSERT INTO solicitud_tipo (tiposolicitudid, votos, vigencia, defecto, literalid_si, literalid_no, accion)
SELECT 1, 51, 5, 2, 52001, 52002, 'org.abbatia.process.acciones.accionViajar'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM solicitud_tipo WHERE tiposolicitudid = 1);

INSERT INTO solicitud_tipo (tiposolicitudid, votos, vigencia, defecto, literalid_si, literalid_no, accion)
SELECT 2, 51, 5, 2, 52003, 52004, 'org.abbatia.process.acciones.accionViajarCopiar'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM solicitud_tipo WHERE tiposolicitudid = 2);

-- Literales minimos (idioma 1) para mensajes de resolucion de solicitudes
DELETE FROM literales WHERE idiomaid = 1 AND literalid BETWEEN 52001 AND 52004;
INSERT INTO literales (literalid, idiomaid, literal) VALUES
(52001, 1, 'Solicitud de viaje aprobada'),
(52002, 1, 'Solicitud de viaje denegada'),
(52003, 1, 'Solicitud de viaje de copia aprobada'),
(52004, 1, 'Solicitud de viaje de copia denegada');
