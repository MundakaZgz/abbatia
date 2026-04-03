-- ============================================================
-- 005_bootstrap_compat.sql
-- Compatibilidad de bootstrap para esquema generado desde código
-- 1) IDs lógicos de dominio (monjeid/edificioid)
-- 2) Catálogos base y columnas esperadas por SQL legacy
-- ============================================================
SET NAMES utf8;

-- ============================================================
-- 1) IDs LÓGICOS: MONJE / EDIFICIO
-- El código SQL legacy usa monjeid/edificioid como identificadores
-- funcionales. El esquema generado dejó _pk como PK AUTO_INCREMENT.
-- Esta migración alinea el esquema para que generated keys y joins
-- funcionen con monjeid/edificioid.
-- ============================================================

UPDATE monje
SET monjeid = _pk
WHERE monjeid IS NULL;

UPDATE edificio
SET edificioid = _pk
WHERE edificioid IS NULL;

SET @db_name = DATABASE();

SET @sql_stmt = (
  SELECT IF(
    EXISTS (
      SELECT 1
      FROM information_schema.statistics
      WHERE table_schema = @db_name
        AND table_name = 'monje'
        AND index_name = 'uk_monje_pk'
    ),
    'ALTER TABLE monje DROP INDEX uk_monje_pk',
    'SELECT 1'
  )
);
PREPARE stmt FROM @sql_stmt;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql_stmt = (
  SELECT IF(
    EXISTS (
      SELECT 1
      FROM information_schema.statistics
      WHERE table_schema = @db_name
        AND table_name = 'edificio'
        AND index_name = 'uk_edificio_pk'
    ),
    'ALTER TABLE edificio DROP INDEX uk_edificio_pk',
    'SELECT 1'
  )
);
PREPARE stmt FROM @sql_stmt;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

ALTER TABLE monje
DROP PRIMARY KEY,
MODIFY COLUMN _pk BIGINT NULL,
MODIFY COLUMN monjeid BIGINT NOT NULL AUTO_INCREMENT,
ADD PRIMARY KEY (monjeid),
ADD UNIQUE KEY uk_monje_pk (_pk);

ALTER TABLE edificio
DROP PRIMARY KEY,
MODIFY COLUMN _pk BIGINT NULL,
MODIFY COLUMN edificioid BIGINT NOT NULL AUTO_INCREMENT,
ADD PRIMARY KEY (edificioid),
ADD UNIQUE KEY uk_edificio_pk (_pk);

-- ============================================================
-- 2) CATÁLOGOS / ESTRUCTURA BASE FALTANTE
-- ============================================================

CREATE TABLE IF NOT EXISTS actividad_tipo_asignable (
  _pk BIGINT NOT NULL AUTO_INCREMENT,
  actividadid BIGINT NULL,
  jerarquiaid BIGINT NULL,
  PRIMARY KEY (_pk)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET @sql_stmt = (
  SELECT IF(
    EXISTS (
      SELECT 1
      FROM information_schema.columns
      WHERE table_schema = @db_name
        AND table_name = 'actividad_tipo'
        AND column_name = 'literalid'
    ),
    'SELECT 1',
    'ALTER TABLE actividad_tipo ADD COLUMN literalid BIGINT NULL AFTER actividadid'
  )
);
PREPARE stmt FROM @sql_stmt;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql_stmt = (
  SELECT IF(
    EXISTS (
      SELECT 1
      FROM information_schema.columns
      WHERE table_schema = @db_name
        AND table_name = 'actividad_tipo'
        AND column_name = 'asignable'
    ),
    'SELECT 1',
    'ALTER TABLE actividad_tipo ADD COLUMN asignable INT NULL AFTER puntuacion'
  )
);
PREPARE stmt FROM @sql_stmt;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql_stmt = (
  SELECT IF(
    EXISTS (
      SELECT 1
      FROM information_schema.columns
      WHERE table_schema = @db_name
        AND table_name = 'actividad'
        AND column_name = 'realizado'
    ),
    'SELECT 1',
    'ALTER TABLE actividad ADD COLUMN realizado INT NULL AFTER nivel'
  )
);
PREPARE stmt FROM @sql_stmt;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

UPDATE actividad
SET realizado = 0
WHERE realizado IS NULL;

DELETE FROM actividad_tipo_asignable
WHERE jerarquiaid IN (1, 2, 3, 5, 6);

DELETE FROM actividad_tipo
WHERE actividadid IN (0, 1, 2, 3, 4, 6, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19);

DELETE FROM edificio_tipo
WHERE tipoedificioid IN (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 22, 23, 24, 25, 26, 99);

DELETE FROM edificio_nivel
WHERE tipoedificioid IN (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 22, 23, 24, 25, 26, 99)
  AND nivel = 1;

DELETE FROM jerarquia_eclesiastica
WHERE jerarquiaid IN (1, 2, 3, 5, 6);

DELETE FROM literales
WHERE idiomaid = 1
  AND literalid BETWEEN 50010 AND 50199;

INSERT INTO literales (literalid, idiomaid, literal) VALUES
(50010, 1, 'Monje'),
(50011, 1, 'Abad'),
(50012, 1, 'Obispo'),
(50013, 1, 'Cardenal'),
(50014, 1, 'Papa'),
(50020, 1, 'Muros'),
(50021, 1, 'Oratorio'),
(50022, 1, 'Claustro'),
(50023, 1, 'Dormitorio'),
(50024, 1, 'Comedor'),
(50025, 1, 'Cocina'),
(50026, 1, 'Biblioteca'),
(50027, 1, 'Granja'),
(50028, 1, 'Granero'),
(50029, 1, 'Molino'),
(50030, 1, 'Taller de Costura'),
(50031, 1, 'Taller de Artesania'),
(50032, 1, 'Almacen'),
(50033, 1, 'Enfermeria'),
(50034, 1, 'Noviciado'),
(50035, 1, 'Escuela'),
(50036, 1, 'Hospederia'),
(50037, 1, 'Sala Capitular'),
(50038, 1, 'Retrete'),
(50039, 1, 'Coro'),
(50040, 1, 'Calefactorio'),
(50041, 1, 'Establo'),
(50042, 1, 'Campo'),
(50043, 1, 'Iglesia'),
(50044, 1, 'Mercado'),
(50045, 1, 'Cementerio'),
(50046, 1, 'Abadia'),
(50100, 1, 'Dormir'),
(50101, 1, 'Rezar'),
(50102, 1, 'Agricultura'),
(50103, 1, 'Talar'),
(50104, 1, 'Pescar'),
(50106, 1, 'Curar'),
(50108, 1, 'Copiar'),
(50109, 1, 'Ensenar'),
(50110, 1, 'Labor de Abad'),
(50111, 1, 'Ganaderia'),
(50112, 1, 'Comer'),
(50113, 1, 'Molinero'),
(50114, 1, 'Elaborar alimento'),
(50115, 1, 'Elaborar recurso'),
(50116, 1, 'Elaborar costura'),
(50117, 1, 'Elaborar artesania'),
(50118, 1, 'Aprender'),
(50119, 1, 'Restaurar libros'),
(50150, 1, 'durmiendo'),
(50151, 1, 'rezando'),
(50152, 1, 'trabajando en agricultura'),
(50153, 1, 'talando'),
(50154, 1, 'pescando'),
(50156, 1, 'curando'),
(50158, 1, 'copiando'),
(50159, 1, 'ensenando'),
(50160, 1, 'gobernando'),
(50161, 1, 'en ganaderia'),
(50162, 1, 'comiendo'),
(50163, 1, 'moliendo'),
(50164, 1, 'elaborando alimento'),
(50165, 1, 'elaborando recurso'),
(50166, 1, 'elaborando costura'),
(50167, 1, 'elaborando artesania'),
(50168, 1, 'aprendiendo'),
(50169, 1, 'restaurando libros');

INSERT INTO jerarquia_eclesiastica (id, jerarquiaid, literalid, descripcion) VALUES
(1, 1, 50010, 'Monje'),
(2, 2, 50011, 'Abad'),
(3, 3, 50012, 'Obispo'),
(5, 5, 50013, 'Cardenal'),
(6, 6, 50014, 'Papa');

INSERT INTO actividad_tipo (actividadid, literalid, literalid_gerundio, descripcion, puntuacion, asignable) VALUES
(0, 50100, '50150', 'Dormir', '0', 1),
(1, 50101, '50151', 'Rezar', '0', 1),
(2, 50102, '50152', 'Agricultura', '0', 1),
(3, 50103, '50153', 'Talar', '0', 1),
(4, 50104, '50154', 'Pescar', '0', 1),
(6, 50106, '50156', 'Curar', '0', 1),
(8, 50108, '50158', 'Copiar', '0', 1),
(9, 50109, '50159', 'Ensenar', '0', 1),
(10, 50110, '50160', 'Labor de Abad', '0', 1),
(11, 50111, '50161', 'Ganaderia', '0', 1),
(12, 50112, '50162', 'Comer', '0', 1),
(13, 50113, '50163', 'Molinero', '0', 1),
(14, 50114, '50164', 'Elaborar alimento', '0', 1),
(15, 50115, '50165', 'Elaborar recurso', '0', 1),
(16, 50116, '50166', 'Elaborar costura', '0', 1),
(17, 50117, '50167', 'Elaborar artesania', '0', 1),
(18, 50118, '50168', 'Aprender', '0', 1),
(19, 50119, '50169', 'Restaurar libros', '0', 1);

INSERT INTO actividad_tipo_asignable (actividadid, jerarquiaid) VALUES
(0, 1), (1, 1), (2, 1), (3, 1), (4, 1), (6, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1), (16, 1), (17, 1), (18, 1), (19, 1),
(0, 2), (1, 2), (2, 2), (3, 2), (4, 2), (6, 2), (8, 2), (9, 2), (10, 2), (11, 2), (12, 2), (13, 2), (14, 2), (15, 2), (16, 2), (17, 2), (18, 2), (19, 2),
(0, 3), (1, 3), (2, 3), (3, 3), (4, 3), (6, 3), (8, 3), (9, 3), (10, 3), (11, 3), (12, 3), (13, 3), (14, 3), (15, 3), (16, 3), (17, 3), (18, 3), (19, 3),
(0, 5), (1, 5), (2, 5), (3, 5), (4, 5), (6, 5), (8, 5), (9, 5), (10, 5), (11, 5), (12, 5), (13, 5), (14, 5), (15, 5), (16, 5), (17, 5), (18, 5), (19, 5),
(0, 6), (1, 6), (2, 6), (3, 6), (4, 6), (6, 6), (8, 6), (9, 6), (10, 6), (11, 6), (12, 6), (13, 6), (14, 6), (15, 6), (16, 6), (17, 6), (18, 6), (19, 6);

INSERT INTO edificio_tipo (tipoedificioid, nombre, grafico_1, grafico_2, actividad_tipo) VALUES
(0, 50020, '', '', ''),
(1, 50021, '', '', ''),
(2, 50022, '', '', ''),
(3, 50023, '', '', ''),
(4, 50024, '', '', ''),
(5, 50025, '', '', ''),
(6, 50026, '', '', ''),
(7, 50027, '', '', ''),
(8, 50028, '', '', ''),
(9, 50029, '', '', ''),
(10, 50030, '', '', ''),
(11, 50031, '', '', ''),
(12, 50032, '', '', ''),
(13, 50033, '', '', ''),
(14, 50034, '', '', ''),
(15, 50035, '', '', ''),
(16, 50036, '', '', ''),
(17, 50037, '', '', ''),
(18, 50038, '', '', ''),
(19, 50039, '', '', ''),
(20, 50040, '', '', ''),
(22, 50041, '', '', ''),
(23, 50042, '', '', ''),
(24, 50043, '', '', ''),
(25, 50044, '', '', ''),
(26, 50045, '', '', ''),
(99, 50046, '', '', '');

INSERT INTO edificio_nivel (tipoedificioid, nivel, almacenamiento, capacidadvital, tiempo_construccion, recurso_piedra) VALUES
(0, 1, 0, 0, 0, '0'),
(1, 1, 0, 0, 0, '0'),
(2, 1, 0, 0, 0, '0'),
(3, 1, 0, 0, 0, '0'),
(4, 1, 0, 0, 0, '0'),
(5, 1, 0, 0, 0, '0'),
(6, 1, 0, 0, 0, '0'),
(7, 1, 0, 0, 0, '0'),
(8, 1, 0, 0, 0, '0'),
(9, 1, 0, 0, 0, '0'),
(10, 1, 0, 0, 0, '0'),
(11, 1, 0, 0, 0, '0'),
(12, 1, 0, 0, 0, '0'),
(13, 1, 0, 0, 0, '0'),
(14, 1, 0, 0, 0, '0'),
(15, 1, 0, 0, 0, '0'),
(16, 1, 0, 0, 0, '0'),
(17, 1, 0, 0, 0, '0'),
(18, 1, 0, 0, 0, '0'),
(19, 1, 0, 0, 0, '0'),
(20, 1, 0, 0, 0, '0'),
(22, 1, 0, 0, 0, '0'),
(23, 1, 0, 0, 0, '0'),
(24, 1, 0, 0, 0, '0'),
(25, 1, 0, 0, 0, '0'),
(26, 1, 0, 0, 0, '0'),
(99, 1, 0, 0, 0, '0');