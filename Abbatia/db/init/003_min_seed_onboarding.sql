-- Seed minimo para habilitar el flujo de alta de abadia
-- (registroAbadia2/3 requiere region + ciudades + nombres por region)

SET NAMES utf8;

INSERT INTO region (regionid, nom, descripcion, idiomaid)
SELECT 1, 'CASTILLA', 'Castilla', 1
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM region WHERE regionid = 1);

UPDATE region
SET nom = 'CASTILLA', descripcion = 'Castilla'
WHERE regionid = 1;

DELETE FROM region_ciudades WHERE regionid = 1;
INSERT INTO region_ciudades (regionid, nombre, temporal) VALUES
(1, 'Burgos', 'Castilla'),
(1, 'Toledo', 'Castilla'),
(1, 'Avila', 'Castilla'),
(1, 'Segovia', 'Castilla'),
(1, 'Soria', 'Castilla');

DELETE FROM tablas WHERE codigo = 'NOM_CASTILLA';
INSERT INTO tablas (codigo, subcodigo, idiomaid, orden, descripcion, valor) VALUES
('NOM_CASTILLA', '1', 1, 1, 'Martin', 0),
('NOM_CASTILLA', '2', 1, 2, 'Pedro', 0),
('NOM_CASTILLA', '3', 1, 3, 'Juan', 0),
('NOM_CASTILLA', '4', 1, 4, 'Diego', 0),
('NOM_CASTILLA', '5', 1, 5, 'Alonso', 0),
('NOM_CASTILLA', '6', 1, 6, 'Gonzalo', 0);

DELETE FROM tablas WHERE codigo IN ('SEXO', 'EDAD', 'PAIS');
INSERT INTO tablas (codigo, subcodigo, idiomaid, orden, descripcion, valor) VALUES
('SEXO', '1', 1, 1, 'Hombre', 0),
('SEXO', '2', 1, 2, 'Mujer', 0),
('EDAD', '16', 1, 16, '16', 0),
('EDAD', '17', 1, 17, '17', 0),
('EDAD', '18', 1, 18, '18', 0),
('EDAD', '19', 1, 19, '19', 0),
('EDAD', '20', 1, 20, '20', 0),
('EDAD', '21', 1, 21, '21', 0),
('EDAD', '22', 1, 22, '22', 0),
('EDAD', '23', 1, 23, '23', 0),
('EDAD', '24', 1, 24, '24', 0),
('EDAD', '25', 1, 25, '25', 0),
('EDAD', '26', 1, 26, '26', 0),
('EDAD', '27', 1, 27, '27', 0),
('EDAD', '28', 1, 28, '28', 0),
('EDAD', '29', 1, 29, '29', 0),
('EDAD', '30', 1, 30, '30', 0),
('EDAD', '31', 1, 31, '31', 0),
('EDAD', '32', 1, 32, '32', 0),
('EDAD', '33', 1, 33, '33', 0),
('EDAD', '34', 1, 34, '34', 0),
('EDAD', '35', 1, 35, '35', 0),
('EDAD', '36', 1, 36, '36', 0),
('EDAD', '37', 1, 37, '37', 0),
('EDAD', '38', 1, 38, '38', 0),
('EDAD', '39', 1, 39, '39', 0),
('EDAD', '40', 1, 40, '40', 0),
('EDAD', '41', 1, 41, '41', 0),
('EDAD', '42', 1, 42, '42', 0),
('EDAD', '43', 1, 43, '43', 0),
('EDAD', '44', 1, 44, '44', 0),
('EDAD', '45', 1, 45, '45', 0),
('EDAD', '46', 1, 46, '46', 0),
('EDAD', '47', 1, 47, '47', 0),
('EDAD', '48', 1, 48, '48', 0),
('EDAD', '49', 1, 49, '49', 0),
('EDAD', '50', 1, 50, '50', 0),
('EDAD', '51', 1, 51, '51', 0),
('EDAD', '52', 1, 52, '52', 0),
('EDAD', '53', 1, 53, '53', 0),
('EDAD', '54', 1, 54, '54', 0),
('EDAD', '55', 1, 55, '55', 0),
('EDAD', '56', 1, 56, '56', 0),
('EDAD', '57', 1, 57, '57', 0),
('EDAD', '58', 1, 58, '58', 0),
('EDAD', '59', 1, 59, '59', 0),
('EDAD', '60', 1, 60, '60', 0),
('EDAD', '61', 1, 61, '61', 0),
('EDAD', '62', 1, 62, '62', 0),
('EDAD', '63', 1, 63, '63', 0),
('EDAD', '64', 1, 64, '64', 0),
('EDAD', '65', 1, 65, '65', 0),
('EDAD', '66', 1, 66, '66', 0),
('EDAD', '67', 1, 67, '67', 0),
('EDAD', '68', 1, 68, '68', 0),
('EDAD', '69', 1, 69, '69', 0),
('EDAD', '70', 1, 70, '70', 0),
('PAIS', '34', 1, 34, 'Espana', 0),
('PAIS', '76', 1, 76, 'Brasil', 0),
('PAIS', '194', 1, 194, 'Argentina', 0),
('PAIS', '840', 1, 840, 'Estados Unidos', 0);
