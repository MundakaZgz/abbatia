-- Compatibilidad bootstrap: columnas de alimentacion historica usadas por adMonje
-- MySQL 5.7 no soporta ADD COLUMN IF NOT EXISTS, por eso se usa info_schema + SQL dinamico.

SET @schema_name = DATABASE();

SET @col_exists = (
  SELECT COUNT(*)
  FROM information_schema.columns
  WHERE table_schema = @schema_name
    AND table_name = 'monje_alimentacion'
    AND column_name = 'ha_comido_familiaid_1'
);
SET @sql = IF(@col_exists = 0,
  'ALTER TABLE monje_alimentacion ADD COLUMN ha_comido_familiaid_1 VARCHAR(255) NULL',
  'SELECT 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = (
  SELECT COUNT(*)
  FROM information_schema.columns
  WHERE table_schema = @schema_name
    AND table_name = 'monje_alimentacion'
    AND column_name = 'ha_comido_familiaid_2'
);
SET @sql = IF(@col_exists = 0,
  'ALTER TABLE monje_alimentacion ADD COLUMN ha_comido_familiaid_2 VARCHAR(255) NULL',
  'SELECT 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = (
  SELECT COUNT(*)
  FROM information_schema.columns
  WHERE table_schema = @schema_name
    AND table_name = 'monje_alimentacion'
    AND column_name = 'ha_comido_familiaid_3'
);
SET @sql = IF(@col_exists = 0,
  'ALTER TABLE monje_alimentacion ADD COLUMN ha_comido_familiaid_3 VARCHAR(255) NULL',
  'SELECT 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = (
  SELECT COUNT(*)
  FROM information_schema.columns
  WHERE table_schema = @schema_name
    AND table_name = 'monje_alimentacion'
    AND column_name = 'ha_comido_familiaid_4'
);
SET @sql = IF(@col_exists = 0,
  'ALTER TABLE monje_alimentacion ADD COLUMN ha_comido_familiaid_4 VARCHAR(255) NULL',
  'SELECT 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @col_exists = (
  SELECT COUNT(*)
  FROM information_schema.columns
  WHERE table_schema = @schema_name
    AND table_name = 'monje_alimentacion'
    AND column_name = 'ha_comido_familiaid_5'
);
SET @sql = IF(@col_exists = 0,
  'ALTER TABLE monje_alimentacion ADD COLUMN ha_comido_familiaid_5 VARCHAR(255) NULL',
  'SELECT 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
