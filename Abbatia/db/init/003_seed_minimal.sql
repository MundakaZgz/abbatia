-- Datos mínimos para poder navegar por la app sin dump histórico
SET NAMES utf8;

INSERT INTO idioma (id, idiomaid, asignable, descripcion)
SELECT 1, 1, 1, 'Español'
WHERE NOT EXISTS (SELECT 1 FROM idioma WHERE idiomaid = 1);

INSERT INTO idioma (id, idiomaid, asignable, descripcion)
SELECT 2, 2, 1, 'Català'
WHERE NOT EXISTS (SELECT 1 FROM idioma WHERE idiomaid = 2);

INSERT INTO region (id, idiomaid, regionid, descripcion, nom)
SELECT 1, 1, 1, 'Castilla', 'Castilla'
WHERE NOT EXISTS (SELECT 1 FROM region WHERE regionid = 1);

INSERT INTO novedades (fecha, mensaje, mostrar)
SELECT NOW(), 'Instancia local inicializada sin dump histórico. Esquema generado por ingeniería inversa.', 0
WHERE NOT EXISTS (SELECT 1 FROM novedades);
