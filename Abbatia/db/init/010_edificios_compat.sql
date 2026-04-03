-- ============================================================
-- 010_edificios_compat.sql
-- Compatibilidad de esquema para vista de edificios
-- ============================================================
SET NAMES utf8;

SET @schema_name = DATABASE();

-- recurso.estado (usado en adRecurso.recuperarRecursos)
SET @col_exists = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema = @schema_name AND table_name = 'recurso' AND column_name = 'estado'
);
SET @sql = IF(@col_exists = 0,
  'ALTER TABLE recurso ADD COLUMN estado INT NULL AFTER cantidad',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

UPDATE recurso
SET estado = 100
WHERE estado IS NULL;

-- recurso_tipo.deteriorable (usado en procesos de desgaste)
SET @col_exists = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema = @schema_name AND table_name = 'recurso_tipo' AND column_name = 'deteriorable'
);
SET @sql = IF(@col_exists = 0,
  'ALTER TABLE recurso_tipo ADD COLUMN deteriorable INT NULL AFTER unidad_medida',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

UPDATE recurso_tipo
SET deteriorable = COALESCE(deteriorable, 0);

-- alimentos_tipo.saladoid (usado en listados de alacena/cocina)
SET @col_exists = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema = @schema_name AND table_name = 'alimentos_tipo' AND column_name = 'saladoid'
);
SET @sql = IF(@col_exists = 0,
  'ALTER TABLE alimentos_tipo ADD COLUMN saladoid BIGINT NULL AFTER alimentoid',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- campo_estado + literales (usado en adCampo.getCultivosAbadia)
CREATE TABLE IF NOT EXISTS campo_estado (
  _pk BIGINT NOT NULL AUTO_INCREMENT,
  estado BIGINT NULL,
  literalid BIGINT NULL,
  PRIMARY KEY (_pk)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET @col_exists = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema = @schema_name AND table_name = 'campo_estado' AND column_name = 'estado'
);
SET @sql = IF(@col_exists = 0,
  'ALTER TABLE campo_estado ADD COLUMN estado BIGINT NULL AFTER _pk',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema = @schema_name AND table_name = 'campo_estado' AND column_name = 'literalid'
);
SET @sql = IF(@col_exists = 0,
  'ALTER TABLE campo_estado ADD COLUMN literalid BIGINT NULL AFTER estado',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

DELETE FROM campo_estado WHERE estado IN (0,1,2,3,4,5);
INSERT INTO campo_estado (estado, literalid) VALUES
(0, 50230),
(1, 50231),
(2, 50232),
(3, 50233),
(4, 50234),
(5, 50235);

DELETE FROM literales WHERE idiomaid = 1 AND literalid BETWEEN 50230 AND 50235;
INSERT INTO literales (literalid, idiomaid, literal) VALUES
(50230, 1, 'Inactivo'),
(50231, 1, 'Arando'),
(50232, 1, 'Arado'),
(50233, 1, 'Sembrando'),
(50234, 1, 'Cultivando'),
(50235, 1, 'Recogiendo');