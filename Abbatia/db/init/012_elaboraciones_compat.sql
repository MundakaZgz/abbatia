-- ============================================================
-- 012_elaboraciones_compat.sql
-- Compatibilidad para modulo de elaboraciones + grafico almacen
-- ============================================================
SET NAMES utf8;

SET @schema_name = DATABASE();

-- ------------------------------------------------------------
-- elaboracion_alimentos: columnas usadas por adElaboracion*
-- ------------------------------------------------------------
SET @col_exists = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema = @schema_name AND table_name = 'elaboracion_alimentos' AND column_name = 'productoid'
);
SET @sql = IF(@col_exists = 0,
  'ALTER TABLE elaboracion_alimentos ADD COLUMN productoid BIGINT NULL AFTER elaboracionid',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @col_exists = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema = @schema_name AND table_name = 'elaboracion_alimentos' AND column_name = 'edificioid'
);
SET @sql = IF(@col_exists = 0,
  'ALTER TABLE elaboracion_alimentos ADD COLUMN edificioid BIGINT NULL AFTER productoid',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- Migracion de dato legacy: la columna id era usada como productoid.
UPDATE elaboracion_alimentos
SET productoid = id
WHERE productoid IS NULL AND id IS NOT NULL;

-- Asegurar elaboracionid usable por consultas/actualizaciones legacy.
UPDATE elaboracion_alimentos
SET elaboracionid = _pk
WHERE elaboracionid IS NULL OR elaboracionid = 0;

SET @idx_exists = (
  SELECT COUNT(*) FROM information_schema.statistics
  WHERE table_schema = @schema_name AND table_name = 'elaboracion_alimentos' AND index_name = 'idx_elaboracion_alimentos_elaboracionid'
);
SET @sql = IF(@idx_exists = 0,
  'CREATE INDEX idx_elaboracion_alimentos_elaboracionid ON elaboracion_alimentos (elaboracionid)',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @idx_exists = (
  SELECT COUNT(*) FROM information_schema.statistics
  WHERE table_schema = @schema_name AND table_name = 'elaboracion_alimentos' AND index_name = 'idx_elaboracion_alimentos_producto_edificio'
);
SET @sql = IF(@idx_exists = 0,
  'CREATE INDEX idx_elaboracion_alimentos_producto_edificio ON elaboracion_alimentos (productoid, edificioid)',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- Trigger para inserts legacy que no envian elaboracionid.
DROP TRIGGER IF EXISTS bi_elaboracion_alimentos_elaboracionid;
DELIMITER $$
CREATE TRIGGER bi_elaboracion_alimentos_elaboracionid
BEFORE INSERT ON elaboracion_alimentos
FOR EACH ROW
BEGIN
  IF NEW.elaboracionid IS NULL OR NEW.elaboracionid = 0 THEN
    SET NEW.elaboracionid = (SELECT COALESCE(MAX(ea.elaboracionid), 0) + 1 FROM elaboracion_alimentos ea);
  END IF;
END$$
DELIMITER ;

-- ------------------------------------------------------------
-- Tablas de catalogo de elaboraciones
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS elaboracion_parametros (
  _pk BIGINT NOT NULL AUTO_INCREMENT,
  productoid BIGINT NULL,
  tipo_producto VARCHAR(2) NULL,
  tipo_edificioid BIGINT NULL,
  ctd_procesa_dia INT NULL,
  tiempo_total INT NULL,
  ctd_total INT NULL,
  PRIMARY KEY (_pk)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET @idx_exists = (
  SELECT COUNT(*) FROM information_schema.statistics
  WHERE table_schema = @schema_name AND table_name = 'elaboracion_parametros' AND index_name = 'idx_elaboracion_parametros_producto'
);
SET @sql = IF(@idx_exists = 0,
  'CREATE INDEX idx_elaboracion_parametros_producto ON elaboracion_parametros (productoid)',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @idx_exists = (
  SELECT COUNT(*) FROM information_schema.statistics
  WHERE table_schema = @schema_name AND table_name = 'elaboracion_parametros' AND index_name = 'idx_elaboracion_parametros_tipo'
);
SET @sql = IF(@idx_exists = 0,
  'CREATE INDEX idx_elaboracion_parametros_tipo ON elaboracion_parametros (tipo_producto, tipo_edificioid)',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

CREATE TABLE IF NOT EXISTS elaboracion_requisitos (
  _pk BIGINT NOT NULL AUTO_INCREMENT,
  productoid BIGINT NULL,
  requisitoid BIGINT NULL,
  cantidad DECIMAL(12,4) NULL,
  tipo_requisito VARCHAR(2) NULL,
  PRIMARY KEY (_pk)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET @idx_exists = (
  SELECT COUNT(*) FROM information_schema.statistics
  WHERE table_schema = @schema_name AND table_name = 'elaboracion_requisitos' AND index_name = 'idx_elaboracion_requisitos_producto'
);
SET @sql = IF(@idx_exists = 0,
  'CREATE INDEX idx_elaboracion_requisitos_producto ON elaboracion_requisitos (productoid)',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

CREATE TABLE IF NOT EXISTS elaboracion_estado (
  _pk BIGINT NOT NULL AUTO_INCREMENT,
  estado INT NULL,
  literalid BIGINT NULL,
  PRIMARY KEY (_pk)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET @idx_exists = (
  SELECT COUNT(*) FROM information_schema.statistics
  WHERE table_schema = @schema_name AND table_name = 'elaboracion_estado' AND index_name = 'idx_elaboracion_estado_estado'
);
SET @sql = IF(@idx_exists = 0,
  'CREATE INDEX idx_elaboracion_estado_estado ON elaboracion_estado (estado)',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

DELETE FROM elaboracion_estado WHERE estado IN (1,2,3,4,5,6,7);
INSERT INTO elaboracion_estado (estado, literalid) VALUES
(1, 50901),
(2, 50902),
(3, 50903),
(4, 50904),
(5, 50905),
(6, 50906),
(7, 50907);

DELETE FROM literales WHERE idiomaid = 1 AND literalid BETWEEN 50901 AND 50907;
INSERT INTO literales (literalid, idiomaid, literal) VALUES
(50901, 1, 'Elaborando'),
(50902, 1, 'Detenida por recursos'),
(50903, 1, 'Detenida por monjes'),
(50904, 1, 'Finalizada'),
(50905, 1, 'Reposando'),
(50906, 1, 'Pendiente'),
(50907, 1, 'Pausada');

-- ------------------------------------------------------------
-- Compat typo legacy: adElaboracionRecursos usa recursos_tipo
-- ------------------------------------------------------------
SET @resources_tipo_exists = (
  SELECT COUNT(*) FROM information_schema.tables
  WHERE table_schema = @schema_name AND table_name = 'recursos_tipo'
);
SET @sql = IF(@resources_tipo_exists = 0,
  'CREATE VIEW recursos_tipo AS SELECT _pk, literalid, recursoid, edificioid_almacen, unidad_medida, deteriorable, volumen FROM recurso_tipo',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- ------------------------------------------------------------
-- Almacen: grafico base (la JSP compone <grafico>_<nivel>.gif)
-- ------------------------------------------------------------
UPDATE edificio_tipo
SET grafico_1 = 'almacen',
    grafico_2 = 'almacen'
WHERE tipoedificioid = 12
  AND (grafico_1 LIKE '12_%' OR grafico_1 LIKE '%.gif%' OR grafico_2 LIKE '12_%' OR grafico_2 LIKE '%.gif%');
