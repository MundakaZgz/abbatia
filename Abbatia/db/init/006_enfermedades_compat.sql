-- ============================================================
-- 006_enfermedades_compat.sql
-- Compatibilidad de esquema para modulo de enfermedades
-- ============================================================
SET NAMES utf8;

CREATE TABLE IF NOT EXISTS enfermedad_tipo (
  _pk BIGINT NOT NULL AUTO_INCREMENT,
  tipo_enfermedadid BIGINT NULL,
  nivel INT NULL,
  variante INT NULL,
  falta_exceso INT NULL,
  propiedadid_impacto BIGINT NULL,
  salud DOUBLE NULL,
  literalid BIGINT NULL,
  duracion INT NULL,
  probabilidad INT NULL,
  literalid_mejora BIGINT NULL,
  literalid_empeora BIGINT NULL,
  PRIMARY KEY (_pk)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS enfermedad_propiedad (
  _pk BIGINT NOT NULL AUTO_INCREMENT,
  tipo_enfermedadid BIGINT NULL,
  nivel INT NULL,
  variante INT NULL,
  propiedadid BIGINT NULL,
  porcentaje_resta INT NULL,
  PRIMARY KEY (_pk)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET @db_name = DATABASE();

SET @sql_stmt = (
  SELECT IF(
    EXISTS (
      SELECT 1
      FROM information_schema.columns
      WHERE table_schema = @db_name
        AND table_name = 'monje_enfermedad'
        AND column_name = 'tipo_enfermedadid'
    ),
    'SELECT 1',
    'ALTER TABLE monje_enfermedad ADD COLUMN tipo_enfermedadid BIGINT NULL AFTER monjeid'
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
        AND table_name = 'monje_enfermedad'
        AND column_name = 'variante'
    ),
    'SELECT 1',
    'ALTER TABLE monje_enfermedad ADD COLUMN variante INT NULL AFTER nivel'
  )
);
PREPARE stmt FROM @sql_stmt;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

UPDATE monje_enfermedad
SET tipo_enfermedadid = COALESCE(tipo_enfermedadid, 1),
    variante = COALESCE(variante, 1)
WHERE tipo_enfermedadid IS NULL OR variante IS NULL;
