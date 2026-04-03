-- ============================================================
-- 007_actividad_periodo_compat.sql
-- Compatibilidad para detalle de monjes (tabla actividad_periodo)
-- ============================================================
SET NAMES utf8;

CREATE TABLE IF NOT EXISTS actividad_periodo (
  _pk BIGINT NOT NULL AUTO_INCREMENT,
  periodoid BIGINT NULL,
  descripcion VARCHAR(255) NULL,
  PRIMARY KEY (_pk)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELETE FROM actividad_periodo
WHERE periodoid IN (0,1,2,3,4,5,6,7,8);

INSERT INTO actividad_periodo (periodoid, descripcion) VALUES
(0, 'Nada'),
(1, 'Maitines'),
(2, 'Laudes'),
(3, 'Prima'),
(4, 'Tercia'),
(5, 'Sexta'),
(6, 'Nona'),
(7, 'Visperas'),
(8, 'Angelus');
