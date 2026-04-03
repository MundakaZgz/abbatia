-- ============================================================
-- 004_seed_game_catalogs.sql
-- Catálogos del juego: regiones, órdenes religiosas, actividades
-- Contexto histórico: Europa cristiana, año 1367
-- ============================================================
SET NAMES utf8;

-- ============================================================
-- REGIONES
-- Territorios del juego extraídos de los scripts de ciudades.
-- regionid = ID lógico usado como FK en abadia.regionid
-- idiomaid = 1 (castellano)
-- ============================================================

INSERT INTO region (id, idiomaid, regionid, descripcion, nom)
SELECT 2, 1, 2, 'Reino de Castilla', 'CASTILLA'
WHERE NOT EXISTS (SELECT 1 FROM region WHERE regionid = 2);

INSERT INTO region (id, idiomaid, regionid, descripcion, nom)
SELECT 3, 1, 3, 'Reino de Navarra', 'NAVARRA'
WHERE NOT EXISTS (SELECT 1 FROM region WHERE regionid = 3);

INSERT INTO region (id, idiomaid, regionid, descripcion, nom)
SELECT 4, 1, 4, 'Reino de Aragón', 'ARAGON'
WHERE NOT EXISTS (SELECT 1 FROM region WHERE regionid = 4);

INSERT INTO region (id, idiomaid, regionid, descripcion, nom)
SELECT 5, 1, 5, 'Condados Catalanes', 'CATALUNA'
WHERE NOT EXISTS (SELECT 1 FROM region WHERE regionid = 5);

INSERT INTO region (id, idiomaid, regionid, descripcion, nom)
SELECT 52, 1, 52, 'Reino de Galicia', 'GALICIA'
WHERE NOT EXISTS (SELECT 1 FROM region WHERE regionid = 52);

INSERT INTO region (id, idiomaid, regionid, descripcion, nom)
SELECT 58, 1, 58, 'Reino de Asturias', 'ASTURIAS'
WHERE NOT EXISTS (SELECT 1 FROM region WHERE regionid = 58);

INSERT INTO region (id, idiomaid, regionid, descripcion, nom)
SELECT 59, 1, 59, 'Reino de León', 'LEON'
WHERE NOT EXISTS (SELECT 1 FROM region WHERE regionid = 59);

INSERT INTO region (id, idiomaid, regionid, descripcion, nom)
SELECT 60, 1, 60, 'Al-Ándalus', 'ANDALUS'
WHERE NOT EXISTS (SELECT 1 FROM region WHERE regionid = 60);

INSERT INTO region (id, idiomaid, regionid, descripcion, nom)
SELECT 61, 1, 61, 'Ducado de Aquitania', 'AQUITANIA'
WHERE NOT EXISTS (SELECT 1 FROM region WHERE regionid = 61);

INSERT INTO region (id, idiomaid, regionid, descripcion, nom)
SELECT 62, 1, 62, 'Livonia', 'LIVONIA'
WHERE NOT EXISTS (SELECT 1 FROM region WHERE regionid = 62);

INSERT INTO region (id, idiomaid, regionid, descripcion, nom)
SELECT 63, 1, 63, 'Ducado de Pomerania', 'POMERANIA'
WHERE NOT EXISTS (SELECT 1 FROM region WHERE regionid = 63);

INSERT INTO region (id, idiomaid, regionid, descripcion, nom)
SELECT 64, 1, 64, 'República de Génova', 'GENOVA'
WHERE NOT EXISTS (SELECT 1 FROM region WHERE regionid = 64);

INSERT INTO region (id, idiomaid, regionid, descripcion, nom)
SELECT 65, 1, 65, 'Ducado de Spoleto', 'SPOLETO'
WHERE NOT EXISTS (SELECT 1 FROM region WHERE regionid = 65);

INSERT INTO region (id, idiomaid, regionid, descripcion, nom)
SELECT 66, 1, 66, 'Reino de Chipre', 'CHIPRE'
WHERE NOT EXISTS (SELECT 1 FROM region WHERE regionid = 66);

INSERT INTO region (id, idiomaid, regionid, descripcion, nom)
SELECT 67, 1, 67, 'Reino de Islandia', 'ISLANDIA'
WHERE NOT EXISTS (SELECT 1 FROM region WHERE regionid = 67);

-- Ciudades semilla para evitar listas vacias en el alta de abadia
DELETE FROM region_ciudades WHERE regionid = 4;
INSERT INTO region_ciudades (regionid, nombre, temporal) VALUES
(4, 'Zaragoza', 'Reino de Aragón'),
(4, 'Huesca', 'Reino de Aragón'),
(4, 'Teruel', 'Reino de Aragón'),
(4, 'Calatayud', 'Reino de Aragón'),
(4, 'Barbastro', 'Reino de Aragón');

-- Nombres regionales (1367) para todas las regiones ofertadas en el alta.
DELETE FROM tablas
WHERE codigo IN (
	'NOM_CASTILLA',
	'NOM_NAVARRA',
	'NOM_ARAGON',
	'NOM_CATALUNA',
	'NOM_GALICIA',
	'NOM_ASTURIAS',
	'NOM_LEON',
	'NOM_ANDALUS',
	'NOM_AQUITANIA',
	'NOM_LIVONIA',
	'NOM_POMERANIA',
	'NOM_GENOVA',
	'NOM_SPOLETO',
	'NOM_CHIPRE',
	'NOM_ISLANDIA'
);

INSERT INTO tablas (codigo, subcodigo, idiomaid, orden, descripcion, valor) VALUES
('NOM_CASTILLA', '1', 1, 1, 'Alfonso', 0),
('NOM_CASTILLA', '2', 1, 2, 'Fernando', 0),
('NOM_CASTILLA', '3', 1, 3, 'Gonzalo', 0),
('NOM_CASTILLA', '4', 1, 4, 'Rodrigo', 0),
('NOM_CASTILLA', '5', 1, 5, 'Sancho', 0),
('NOM_CASTILLA', '6', 1, 6, 'Diego', 0),

('NOM_NAVARRA', '1', 1, 1, 'Garcia', 0),
('NOM_NAVARRA', '2', 1, 2, 'Sancho', 0),
('NOM_NAVARRA', '3', 1, 3, 'Teobaldo', 0),
('NOM_NAVARRA', '4', 1, 4, 'Miguel', 0),
('NOM_NAVARRA', '5', 1, 5, 'Martin', 0),
('NOM_NAVARRA', '6', 1, 6, 'Inigo', 0),

('NOM_ARAGON', '1', 1, 1, 'Pedro', 0),
('NOM_ARAGON', '2', 1, 2, 'Jaime', 0),
('NOM_ARAGON', '3', 1, 3, 'Sancho', 0),
('NOM_ARAGON', '4', 1, 4, 'Guillem', 0),
('NOM_ARAGON', '5', 1, 5, 'Berenguer', 0),
('NOM_ARAGON', '6', 1, 6, 'Ramiro', 0),

('NOM_CATALUNA', '1', 1, 1, 'Ramon', 0),
('NOM_CATALUNA', '2', 1, 2, 'Berenguer', 0),
('NOM_CATALUNA', '3', 1, 3, 'Arnau', 0),
('NOM_CATALUNA', '4', 1, 4, 'Pere', 0),
('NOM_CATALUNA', '5', 1, 5, 'Guillem', 0),
('NOM_CATALUNA', '6', 1, 6, 'Bernat', 0),

('NOM_GALICIA', '1', 1, 1, 'Afonso', 0),
('NOM_GALICIA', '2', 1, 2, 'Paio', 0),
('NOM_GALICIA', '3', 1, 3, 'Nuno', 0),
('NOM_GALICIA', '4', 1, 4, 'Lope', 0),
('NOM_GALICIA', '5', 1, 5, 'Roi', 0),
('NOM_GALICIA', '6', 1, 6, 'Goncalo', 0),

('NOM_ASTURIAS', '1', 1, 1, 'Pelayo', 0),
('NOM_ASTURIAS', '2', 1, 2, 'Alvar', 0),
('NOM_ASTURIAS', '3', 1, 3, 'Rodrigo', 0),
('NOM_ASTURIAS', '4', 1, 4, 'Tello', 0),
('NOM_ASTURIAS', '5', 1, 5, 'Fruela', 0),
('NOM_ASTURIAS', '6', 1, 6, 'Ordono', 0),

('NOM_LEON', '1', 1, 1, 'Alfonso', 0),
('NOM_LEON', '2', 1, 2, 'Ordono', 0),
('NOM_LEON', '3', 1, 3, 'Bermudo', 0),
('NOM_LEON', '4', 1, 4, 'Froila', 0),
('NOM_LEON', '5', 1, 5, 'Munio', 0),
('NOM_LEON', '6', 1, 6, 'Fernando', 0),

('NOM_ANDALUS', '1', 1, 1, 'Muhammad', 0),
('NOM_ANDALUS', '2', 1, 2, 'Yusuf', 0),
('NOM_ANDALUS', '3', 1, 3, 'Ibrahim', 0),
('NOM_ANDALUS', '4', 1, 4, 'Ahmad', 0),
('NOM_ANDALUS', '5', 1, 5, 'Abdallah', 0),
('NOM_ANDALUS', '6', 1, 6, 'Ismail', 0),

('NOM_AQUITANIA', '1', 1, 1, 'Guillaume', 0),
('NOM_AQUITANIA', '2', 1, 2, 'Hugues', 0),
('NOM_AQUITANIA', '3', 1, 3, 'Arnaud', 0),
('NOM_AQUITANIA', '4', 1, 4, 'Bernard', 0),
('NOM_AQUITANIA', '5', 1, 5, 'Pons', 0),
('NOM_AQUITANIA', '6', 1, 6, 'Aymeric', 0),

('NOM_LIVONIA', '1', 1, 1, 'Heinrich', 0),
('NOM_LIVONIA', '2', 1, 2, 'Dietrich', 0),
('NOM_LIVONIA', '3', 1, 3, 'Konrad', 0),
('NOM_LIVONIA', '4', 1, 4, 'Wolmar', 0),
('NOM_LIVONIA', '5', 1, 5, 'Gerhard', 0),
('NOM_LIVONIA', '6', 1, 6, 'Arnold', 0),

('NOM_POMERANIA', '1', 1, 1, 'Bogislaw', 0),
('NOM_POMERANIA', '2', 1, 2, 'Wartislaw', 0),
('NOM_POMERANIA', '3', 1, 3, 'Mestwin', 0),
('NOM_POMERANIA', '4', 1, 4, 'Kazimierz', 0),
('NOM_POMERANIA', '5', 1, 5, 'Ziemowit', 0),
('NOM_POMERANIA', '6', 1, 6, 'Mikolaj', 0),

('NOM_GENOVA', '1', 1, 1, 'Giovanni', 0),
('NOM_GENOVA', '2', 1, 2, 'Pietro', 0),
('NOM_GENOVA', '3', 1, 3, 'Luca', 0),
('NOM_GENOVA', '4', 1, 4, 'Niccolo', 0),
('NOM_GENOVA', '5', 1, 5, 'Giacomo', 0),
('NOM_GENOVA', '6', 1, 6, 'Matteo', 0),

('NOM_SPOLETO', '1', 1, 1, 'Rinaldo', 0),
('NOM_SPOLETO', '2', 1, 2, 'Ugolino', 0),
('NOM_SPOLETO', '3', 1, 3, 'Raniero', 0),
('NOM_SPOLETO', '4', 1, 4, 'Guido', 0),
('NOM_SPOLETO', '5', 1, 5, 'Lamberto', 0),
('NOM_SPOLETO', '6', 1, 6, 'Benvenuto', 0),

('NOM_CHIPRE', '1', 1, 1, 'Hugues', 0),
('NOM_CHIPRE', '2', 1, 2, 'Amaury', 0),
('NOM_CHIPRE', '3', 1, 3, 'Jean', 0),
('NOM_CHIPRE', '4', 1, 4, 'Guy', 0),
('NOM_CHIPRE', '5', 1, 5, 'Philippe', 0),
('NOM_CHIPRE', '6', 1, 6, 'Balian', 0),

('NOM_ISLANDIA', '1', 1, 1, 'Eirikr', 0),
('NOM_ISLANDIA', '2', 1, 2, 'Snorri', 0),
('NOM_ISLANDIA', '3', 1, 3, 'Bjorn', 0),
('NOM_ISLANDIA', '4', 1, 4, 'Leif', 0),
('NOM_ISLANDIA', '5', 1, 5, 'Ketill', 0),
('NOM_ISLANDIA', '6', 1, 6, 'Thorkell', 0);


-- ============================================================
-- ÓRDENES ECLESIÁSTICAS
-- Órdenes monásticas y mendicantes activas en 1367.
-- id = ordenid (valor enviado por el form, FK en abadia.ordenid)
-- ============================================================

DELETE FROM orden_eclesiastica WHERE id IN (1,2,3,4,5,6,7,8);

-- Benedictinos (OSB): fundada por Benito de Nursia en 529, orden más antigua
INSERT INTO orden_eclesiastica (id, ordenid, descripcion)
VALUES (1, 1, 'Benedictinos');

-- Cistercienses (OCist): reforma benedictina fundada en Cîteaux en 1098
INSERT INTO orden_eclesiastica (id, ordenid, descripcion)
VALUES (2, 2, 'Cistercienses');

-- Cartujos (OCart): fundada por Bruno de Colonia en 1084, de vida eremítica
INSERT INTO orden_eclesiastica (id, ordenid, descripcion)
VALUES (3, 3, 'Cartujos');

-- Premonstratenses (OPraem): fundada por Norberto de Xanten en 1120
INSERT INTO orden_eclesiastica (id, ordenid, descripcion)
VALUES (4, 4, 'Premonstratenses');

-- Dominicos (OP): Orden de Predicadores, fundada por Santo Domingo en 1216
INSERT INTO orden_eclesiastica (id, ordenid, descripcion)
VALUES (5, 5, 'Dominicos');

-- Franciscanos (OFM): Orden de Menores, fundada por San Francisco en 1209
INSERT INTO orden_eclesiastica (id, ordenid, descripcion)
VALUES (6, 6, 'Franciscanos');

-- Carmelitas (OCarm): origen en el Monte Carmelo, regla aprobada en 1247
INSERT INTO orden_eclesiastica (id, ordenid, descripcion)
VALUES (7, 7, 'Carmelitas');

-- Agustinos (OSA): Orden de los Ermitaños de San Agustín, unificada en 1256
INSERT INTO orden_eclesiastica (id, ordenid, descripcion)
VALUES (8, 8, 'Agustinos');


-- ============================================================
-- ACTIVIDADES PREFERENTES
-- Constantes Java: AGRICULTURA=1, GANADERIA=2, ESCRIBAS=3
-- Cargadas con getClaveValor("ACTIVI") → tablas donde CODIGO='ACTIVI'
-- subcodigo = valor del enum Java (int)
-- ============================================================

DELETE FROM tablas WHERE codigo = 'ACTIVI';

INSERT INTO tablas (codigo, subcodigo, idiomaid, orden, descripcion, valor)
VALUES ('ACTIVI', '1', 1, 1, 'Agricultura', 0);

INSERT INTO tablas (codigo, subcodigo, idiomaid, orden, descripcion, valor)
VALUES ('ACTIVI', '2', 1, 2, 'Ganadería', 0);

INSERT INTO tablas (codigo, subcodigo, idiomaid, orden, descripcion, valor)
VALUES ('ACTIVI', '3', 1, 3, 'Escribas', 0);
