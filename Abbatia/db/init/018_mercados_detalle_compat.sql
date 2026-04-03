-- ============================================================
-- 018_mercados_detalle_compat.sql
-- Compatibilidad mercado_compra_detalle (adMercadoCompra)
-- ============================================================
SET NAMES utf8;

SET @db_name = DATABASE();

-- mercados.fecha_final
SET @sql_stmt = (
  SELECT IF(
    EXISTS (
      SELECT 1
      FROM information_schema.columns
      WHERE table_schema = @db_name
        AND table_name = 'mercados'
        AND column_name = 'fecha_final'
    ),
    'SELECT 1',
    'ALTER TABLE mercados ADD COLUMN fecha_final DATETIME NULL AFTER fecha_inicial'
  )
);
PREPARE stmt FROM @sql_stmt;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- mercados.ctd_inicial
SET @sql_stmt = (
  SELECT IF(
    EXISTS (
      SELECT 1
      FROM information_schema.columns
      WHERE table_schema = @db_name
        AND table_name = 'mercados'
        AND column_name = 'ctd_inicial'
    ),
    'SELECT 1',
    'ALTER TABLE mercados ADD COLUMN ctd_inicial VARCHAR(255) NULL AFTER productoid'
  )
);
PREPARE stmt FROM @sql_stmt;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- mercados.precio_inicial
SET @sql_stmt = (
  SELECT IF(
    EXISTS (
      SELECT 1
      FROM information_schema.columns
      WHERE table_schema = @db_name
        AND table_name = 'mercados'
        AND column_name = 'precio_inicial'
    ),
    'SELECT 1',
    'ALTER TABLE mercados ADD COLUMN precio_inicial DOUBLE NULL AFTER ctd_actual'
  )
);
PREPARE stmt FROM @sql_stmt;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- unidad_medida.descripcion
SET @sql_stmt = (
  SELECT IF(
    EXISTS (
      SELECT 1
      FROM information_schema.columns
      WHERE table_schema = @db_name
        AND table_name = 'unidad_medida'
        AND column_name = 'descripcion'
    ),
    'SELECT 1',
    'ALTER TABLE unidad_medida ADD COLUMN descripcion VARCHAR(255) NULL AFTER unidad_desc'
  )
);
PREPARE stmt FROM @sql_stmt;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Backfill para mantener coherencia con consultas legacy.
UPDATE mercados
SET ctd_inicial = ctd_actual
WHERE (ctd_inicial IS NULL OR TRIM(ctd_inicial) = '')
  AND ctd_actual IS NOT NULL;

UPDATE mercados
SET precio_inicial = precio_actual
WHERE precio_inicial IS NULL
  AND precio_actual IS NOT NULL;

UPDATE unidad_medida
SET descripcion = unidad_desc
WHERE (descripcion IS NULL OR TRIM(descripcion) = '')
  AND unidad_desc IS NOT NULL;
