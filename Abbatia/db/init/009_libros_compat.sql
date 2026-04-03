-- ============================================================
-- 009_libros_compat.sql
-- Compatibilidad de esquema para modulo de libros en vista de edificios
-- ============================================================
SET NAMES utf8;

SET @schema_name = DATABASE();

-- libro.idiomaid
SET @col_exists = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema = @schema_name AND table_name = 'libro' AND column_name = 'idiomaid'
);
SET @sql = IF(@col_exists = 0,
  'ALTER TABLE libro ADD COLUMN idiomaid BIGINT NULL AFTER estado',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- libro.libroid_origen
SET @col_exists = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema = @schema_name AND table_name = 'libro' AND column_name = 'libroid_origen'
);
SET @sql = IF(@col_exists = 0,
  'ALTER TABLE libro ADD COLUMN libroid_origen BIGINT NULL AFTER idiomaid',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- libro.idiomaid_origen
SET @col_exists = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema = @schema_name AND table_name = 'libro' AND column_name = 'idiomaid_origen'
);
SET @sql = IF(@col_exists = 0,
  'ALTER TABLE libro ADD COLUMN idiomaid_origen BIGINT NULL AFTER libroid_origen',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- libro.abadiaid_copia
SET @col_exists = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema = @schema_name AND table_name = 'libro' AND column_name = 'abadiaid_copia'
);
SET @sql = IF(@col_exists = 0,
  'ALTER TABLE libro ADD COLUMN abadiaid_copia BIGINT NULL AFTER idiomaid_origen',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- libro.fecha_adquisicion
SET @col_exists = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema = @schema_name AND table_name = 'libro' AND column_name = 'fecha_adquisicion'
);
SET @sql = IF(@col_exists = 0,
  'ALTER TABLE libro ADD COLUMN fecha_adquisicion DATETIME NULL AFTER fecha_creacion',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- libro_nivel.precio_max
SET @col_exists = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema = @schema_name AND table_name = 'libro_nivel' AND column_name = 'precio_max'
);
SET @sql = IF(@col_exists = 0,
  'ALTER TABLE libro_nivel ADD COLUMN precio_max DOUBLE NULL AFTER nivel',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- libro_nivel.precio_min
SET @col_exists = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema = @schema_name AND table_name = 'libro_nivel' AND column_name = 'precio_min'
);
SET @sql = IF(@col_exists = 0,
  'ALTER TABLE libro_nivel ADD COLUMN precio_min DOUBLE NULL AFTER precio_max',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- libro_nivel.paginas
SET @col_exists = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema = @schema_name AND table_name = 'libro_nivel' AND column_name = 'paginas'
);
SET @sql = IF(@col_exists = 0,
  'ALTER TABLE libro_nivel ADD COLUMN paginas INT NULL AFTER precio_min',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- libro_nivel.ctd_piel_encuadernar
SET @col_exists = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema = @schema_name AND table_name = 'libro_nivel' AND column_name = 'ctd_piel_encuadernar'
);
SET @sql = IF(@col_exists = 0,
  'ALTER TABLE libro_nivel ADD COLUMN ctd_piel_encuadernar DOUBLE NULL AFTER paginas',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- libro_tipo.literalid
SET @col_exists = (
  SELECT COUNT(*) FROM information_schema.columns
  WHERE table_schema = @schema_name AND table_name = 'libro_tipo' AND column_name = 'literalid'
);
SET @sql = IF(@col_exists = 0,
  'ALTER TABLE libro_tipo ADD COLUMN literalid BIGINT NULL AFTER tipo_libroid',
  'SELECT 1');
PREPARE stmt FROM @sql; EXECUTE stmt; DEALLOCATE PREPARE stmt;

CREATE TABLE IF NOT EXISTS libro_estado (
  _pk BIGINT NOT NULL AUTO_INCREMENT,
  estado BIGINT NULL,
  literalid BIGINT NULL,
  PRIMARY KEY (_pk)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Valores por defecto para evitar nulls en calculos y selects
UPDATE libro
SET idiomaid = COALESCE(idiomaid, 1),
    idiomaid_origen = COALESCE(idiomaid_origen, idiomaid),
    libroid_origen = COALESCE(libroid_origen, libroid),
    abadiaid_copia = COALESCE(abadiaid_copia, abadiaid),
    fecha_adquisicion = COALESCE(fecha_adquisicion, fecha_creacion)
WHERE idiomaid IS NULL
   OR idiomaid_origen IS NULL
   OR libroid_origen IS NULL
   OR abadiaid_copia IS NULL
   OR fecha_adquisicion IS NULL;

UPDATE libro_nivel
SET precio_max = COALESCE(precio_max, 100.0),
    precio_min = COALESCE(precio_min, 10.0),
    paginas = COALESCE(paginas, 100),
    ctd_piel_encuadernar = COALESCE(ctd_piel_encuadernar, 1.0)
WHERE precio_max IS NULL
   OR precio_min IS NULL
   OR paginas IS NULL
   OR ctd_piel_encuadernar IS NULL;

-- Seed minimo de estados y tipos para joins con literales
DELETE FROM libro_estado WHERE estado IN (0,1,2,3,4,5);
INSERT INTO libro_estado (estado, literalid) VALUES
(0, 50200),
(1, 50201),
(2, 50202),
(3, 50203),
(4, 50204),
(5, 50205);

DELETE FROM literales WHERE idiomaid = 1 AND literalid BETWEEN 50200 AND 50229;
INSERT INTO literales (literalid, idiomaid, literal) VALUES
(50200, 1, 'Incompleto'),
(50201, 1, 'Completo'),
(50202, 1, 'En copia'),
(50203, 1, 'Restaurando'),
(50204, 1, 'Encuadernando'),
(50205, 1, 'Deteriorado'),
(50210, 1, 'Tratado Basico'),
(50211, 1, 'Tratado Medio'),
(50212, 1, 'Tratado Avanzado');

DELETE FROM libro_tipo WHERE tipo_libroid IN (1,2,3);
INSERT INTO libro_tipo (tipo_libroid, literalid) VALUES
(1, 50210),
(2, 50211),
(3, 50212);

-- Niveles minimos por tipo de libro
DELETE FROM libro_nivel WHERE tipo_libroid IN (1,2,3) AND nivel = 1;
INSERT INTO libro_nivel (tipo_libroid, nivel, desgaste, puntuacion, precio_max, precio_min, paginas, ctd_piel_encuadernar) VALUES
(1, 1, '100', '1', 100.0, 10.0, 100, 1.0),
(2, 1, '100', '2', 200.0, 20.0, 150, 1.0),
(3, 1, '100', '3', 300.0, 30.0, 200, 1.0);
