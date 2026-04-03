-- Auto-generado desde SQL embebido en Java
-- IMPORTANTE: esquema base para arrancar; hay que refinar tipos/FKs/índices
SET NAMES utf8;

CREATE TABLE IF NOT EXISTS `abadia` (
  `_pk` BIGINT NULL,
  `abadiaid` BIGINT NOT NULL AUTO_INCREMENT,
  `ordenid` BIGINT NULL,
  `regionid` BIGINT NULL,
  `usuarioid` BIGINT NULL,
  `fecha_construccion` DATETIME NULL,
  `arquitecto` VARCHAR(255) NULL,
  `capacidad` INT NULL,
  `nivel_jerarquico` INT NULL,
  `historia` TEXT NULL,
  `dummy` VARCHAR(255) NULL,
  `fecha_eliminacion` DATETIME NULL,
  `flag_cardenal` VARCHAR(255) NULL,
  `flag_obispo` VARCHAR(255) NULL,
  `nombre` VARCHAR(255) NULL,
  `posicion` VARCHAR(255) NULL,
  PRIMARY KEY (`abadiaid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `abadia_congelada` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `usuarioid` BIGINT NULL,
  `cantidad` INT NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `abadia_puntuacion` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `abadiaid` BIGINT NULL,
  `id` BIGINT NULL,
  `monjes_nivel` DOUBLE NULL,
  `monjes_habilidad` DOUBLE NULL,
  `monjes_actividad` DOUBLE NULL,
  `monjes_muertos` DOUBLE NULL,
  `santos` DOUBLE NULL,
  `animales` DOUBLE NULL,
  `edificios` DOUBLE NULL,
  `libros` DOUBLE NULL,
  `clasificacion` VARCHAR(255) NULL,
  `clasificacion_regional` INT NULL,
  `fecha_abadia` DATETIME NULL,
  `fecha_real` DATETIME NULL,
  `total` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `abadia_puntuacion_ultima` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `abadiaid` BIGINT NULL,
  `total` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `abbatia` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `abadiaid` BIGINT NULL,
  `nombre` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `actividad` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `actividadid` BIGINT NULL,
  `id` BIGINT NULL,
  `monjeid` BIGINT NULL,
  `periodoid` BIGINT NULL,
  `acumulado_dia` VARCHAR(255) NULL,
  `acumulado_total` VARCHAR(255) NULL,
  `bloqueada` VARCHAR(255) NULL,
  `nivel` INT NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `actividad_mensajes` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `actividadid` BIGINT NULL,
  `id` BIGINT NULL,
  `monjeid` BIGINT NULL,
  `periodoid` BIGINT NULL,
  `cantidad` INT NULL,
  `fechaabadia` DATETIME NULL,
  `mensaje` TEXT NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `actividad_tipo` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `actividadid` BIGINT NULL,
  `descripcion` TEXT NULL,
  `literalid_gerundio` VARCHAR(255) NULL,
  `puntuacion` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `alimentos` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `alimentoid` BIGINT NULL,
  `edificioid` BIGINT NULL,
  `id` BIGINT NULL,
  `loteid` BIGINT NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `alimentos_familia` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `familiaid` BIGINT NULL,
  `literalid` BIGINT NULL,
  `dias_vidas` INT NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `alimentos_lote` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `id` BIGINT NULL,
  `loteid` BIGINT NULL,
  `cantidad` INT NULL,
  `estado` VARCHAR(255) NULL,
  `fecha_caducidad` DATETIME NULL,
  `fecha_entrada` DATETIME NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `alimentos_sal` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `cantidad` INT NULL,
  `dias` INT NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `alimentos_tipo` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `alimentoid` BIGINT NULL,
  `familiaid` BIGINT NULL,
  `literalid` BIGINT NULL,
  `descripcion` TEXT NULL,
  `unidad_medida` VARCHAR(255) NULL,
  `volumen` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `animales` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `animalid` BIGINT NULL,
  `edificioid` BIGINT NULL,
  `id` BIGINT NULL,
  `tipo_animalid` BIGINT NULL,
  `aislado` VARCHAR(255) NULL,
  `estado` VARCHAR(255) NULL,
  `fecha_embarazo` DATETIME NULL,
  `fecha_fallecimiento` DATETIME NULL,
  `fecha_nacimiento` DATETIME NULL,
  `fecha_parido` DATETIME NULL,
  `nivel` INT NULL,
  `salud` VARCHAR(255) NULL,
  `trabaja` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `animales_crecimiento` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `tipo_animalid` BIGINT NULL,
  `mes_cambio_nivel` INT NULL,
  `nivel` INT NULL,
  `volumen` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `animales_crias` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `tiempo_dias_embarazo` INT NULL,
  `tipo_animalid_femenino` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `animales_produccion_alimento` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `alimentoid` BIGINT NULL,
  `edificioid` BIGINT NULL,
  `id` BIGINT NULL,
  `cantidad` INT NULL,
  `recoge_monje` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `animales_produccion_recurso` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `edificioid` BIGINT NULL,
  `id` BIGINT NULL,
  `recursoid` BIGINT NULL,
  `cantidad` INT NULL,
  `recoge_monje` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `campo` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `abadiaid` BIGINT NULL,
  `alimentoid` BIGINT NULL,
  `campoid` BIGINT NULL,
  `arado_total` VARCHAR(255) NULL,
  `cultiva_dia` VARCHAR(255) NULL,
  `cultiva_total` VARCHAR(255) NULL,
  `estado` VARCHAR(255) NULL,
  `fecha_creacion` DATETIME NULL,
  `fecha_cultivo_desde` DATETIME NULL,
  `fecha_cultivo_hasta` DATETIME NULL,
  `fecha_recogida_desde` DATETIME NULL,
  `fecha_recogida_hasta` DATETIME NULL,
  `fecha_siembra` DATETIME NULL,
  `nivel_campo` INT NULL,
  `recogida_total` VARCHAR(255) NULL,
  `siembra_total` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `campo_alimento` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `alimentoid` BIGINT NULL,
  `nivel_arbol` INT NULL,
  `recursoid_siembra` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `campo_monje` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `abadiaid` BIGINT NULL,
  `campoid` BIGINT NULL,
  `id` BIGINT NULL,
  `monjeid` BIGINT NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `cardenales` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `abadiaid` BIGINT NULL,
  `cardenalid` BIGINT NULL,
  `monjeid` BIGINT NULL,
  `funcion` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `cardenales_conclave` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `id` BIGINT NULL,
  `voto_cardenalid` BIGINT NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `comisiones` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `regionid` BIGINT NULL,
  `cancelacion` VARCHAR(255) NULL,
  `obispado` VARCHAR(255) NULL,
  `total` VARCHAR(255) NULL,
  `transito` VARCHAR(255) NULL,
  `venta10` VARCHAR(255) NULL,
  `venta15` VARCHAR(255) NULL,
  `venta5` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `comisiones_cardenales` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `total` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `comisiones_historico` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `abadiaid` BIGINT NULL,
  `id` BIGINT NULL,
  `regionid` BIGINT NULL,
  `fecha` DATETIME NULL,
  `importe` DOUBLE NULL,
  `procesado` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `comisiones_historico_regional` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `id` BIGINT NULL,
  `recaudado` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `comisiones_movima` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `regionid` BIGINT NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `comisiones_papa` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `impuesto_cardenales` VARCHAR(255) NULL,
  `impuesto_papa` VARCHAR(255) NULL,
  `total` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `conclave` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `estado` VARCHAR(255) NULL,
  `fumata` VARCHAR(255) NULL,
  `monjeid_papa_nuevo` VARCHAR(255) NULL,
  `votos_nulos` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `correo` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `abadiaid` BIGINT NULL,
  `correoid` BIGINT NULL,
  `id` BIGINT NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `correo_destinatario` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `abadiaid` BIGINT NULL,
  `correoid` BIGINT NULL,
  `id` BIGINT NULL,
  `leido` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `dieta` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `actividadid` BIGINT NULL,
  `familiaid` BIGINT NULL,
  `jerarquiaid` BIGINT NULL,
  `nivel_abadia` INT NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `edificio` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `abadiaid` BIGINT NULL,
  `edificioid` BIGINT NULL,
  `id` BIGINT NULL,
  `tipoedificioid` BIGINT NULL,
  `estado` VARCHAR(255) NULL,
  `fechaconstruccion` DATETIME NULL,
  `mantenimiento` VARCHAR(255) NULL,
  `nivel` INT NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `edificio_construccion` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `abadiaid` BIGINT NULL,
  `id` BIGINT NULL,
  `tipoedificioid` BIGINT NULL,
  `fecha_construccion` DATETIME NULL,
  `fecha_finalizacion` DATETIME NULL,
  `nivel` INT NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `edificio_nivel` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `tipoedificioid` BIGINT NULL,
  `nivel` INT NULL,
  `almacenamiento` INT NULL,
  `capacidadvital` INT NULL,
  `tiempo_construccion` INT NULL,
  `recurso_piedra` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `edificio_tipo` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `tipoedificioid` BIGINT NULL,
  `nombre` BIGINT NULL,
  `grafico_1` VARCHAR(255) NULL,
  `grafico_2` VARCHAR(255) NULL,
  `actividad_tipo` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `edificios` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `nivel` INT NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `elaboracion_alimentos` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `elaboracionid` BIGINT NULL,
  `id` BIGINT NULL,
  `cantidad` INT NULL,
  `elaborado` VARCHAR(255) NULL,
  `estado` VARCHAR(255) NULL,
  `fecha_fin` DATETIME NULL,
  `fecha_inicio` DATETIME NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `especializacion` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `especializacionid` BIGINT NULL,
  `id` BIGINT NULL,
  `descripcion` TEXT NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `excepcion_max` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `accion` VARCHAR(255) NULL,
  `max` INT NULL,
  `nombre` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `habilidad_monje` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `habilidadid` BIGINT NULL,
  `id` BIGINT NULL,
  `monjeid` BIGINT NULL,
  `valor_actual` DOUBLE NULL,
  `valor_inicial` DOUBLE NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `habilidad_tipo` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `habilidadid` BIGINT NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `idioma` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `id` BIGINT NULL,
  `idiomaid` BIGINT NULL,
  `literalid` BIGINT NULL,
  `asignable` INT NULL,
  `descripcion` TEXT NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `jerarquia_eclesiastica` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `id` BIGINT NULL,
  `jerarquiaid` BIGINT NULL,
  `literalid` BIGINT NULL,
  `descripcion` TEXT NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `libro` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `abadiaid` BIGINT NULL,
  `id` BIGINT NULL,
  `libroid` BIGINT NULL,
  `tipo_libroid` BIGINT NULL,
  `desgaste` VARCHAR(255) NULL,
  `estado` VARCHAR(255) NULL,
  `fecha_creacion` DATETIME NULL,
  `nivel` INT NULL,
  `paginas_copiadas` VARCHAR(255) NULL,
  `precio_copia` DOUBLE NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `libro_nivel` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `tipo_libroid` BIGINT NULL,
  `desgaste` VARCHAR(255) NULL,
  `nivel` INT NULL,
  `puntuacion` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `libro_tarea` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `id` BIGINT NULL,
  `libro_copiaid` BIGINT NULL,
  `libro_origenid` BIGINT NULL,
  `monjeid` BIGINT NULL,
  `periodoid` BIGINT NULL,
  `estado` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `libro_tipo` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `tipo_libroid` BIGINT NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `literales` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `idiomaid` BIGINT NULL,
  `literalid` BIGINT NULL,
  `literal` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `mensajes` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `abadiaid` BIGINT NULL,
  `id` BIGINT NULL,
  `idiomaid` BIGINT NULL,
  `monjeid` BIGINT NULL,
  `regionid` BIGINT NULL,
  `fechaabadia` DATETIME NULL,
  `fechareal` DATETIME NULL,
  `mensaje` TEXT NULL,
  `tipo` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `mercados` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `abadiaid` BIGINT NULL,
  `id` BIGINT NULL,
  `productoid` BIGINT NULL,
  `ctd_actual` VARCHAR(255) NULL,
  `estado` VARCHAR(255) NULL,
  `fecha_inicial` DATETIME NULL,
  `mercancia` VARCHAR(255) NULL,
  `precio_actual` DOUBLE NULL,
  `tipo` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `mercados_alimentos` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `alimentoid` BIGINT NULL,
  `id` BIGINT NULL,
  `productoid` BIGINT NULL,
  `estado` VARCHAR(255) NULL,
  `fecha_caducidad` DATETIME NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `mercados_animales` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `id` BIGINT NULL,
  `productoid` BIGINT NULL,
  `tipo_animalid` BIGINT NULL,
  `fecha_nacimiento` DATETIME NULL,
  `nivel` INT NULL,
  `salud` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `mercados_ciudad_variaciones` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `nr_ventas` VARCHAR(255) NULL,
  `nr_ventas_dia_anterior` VARCHAR(255) NULL,
  `precio_actual` DOUBLE NULL,
  `precio_maximo` DOUBLE NULL,
  `precio_maximo_cardenal` DOUBLE NULL,
  `precio_minimo` DOUBLE NULL,
  `precio_minimo_cardenal` DOUBLE NULL,
  `ventas_dia` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `mercados_libros` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `id` BIGINT NULL,
  `productoid` BIGINT NULL,
  `tipo_libroid` BIGINT NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `mercados_movima` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `abadiaid` BIGINT NULL,
  `id` BIGINT NULL,
  `productoid` BIGINT NULL,
  `ctd` VARCHAR(255) NULL,
  `fecha` DATETIME NULL,
  `precio_unidad` DOUBLE NULL,
  `tipo` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `mercados_recursos` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `id` BIGINT NULL,
  `productoid` BIGINT NULL,
  `recursoid` BIGINT NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `mercados_reliquias` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `id` BIGINT NULL,
  `productoid` BIGINT NULL,
  `tipo_reliquiaid` BIGINT NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `molino_produccion` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `id` BIGINT NULL,
  `ctd_actual` VARCHAR(255) NULL,
  `ctd_inicial` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `molino_tipo` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `recursoid` BIGINT NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `monje` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `abadiaid` BIGINT NULL,
  `id` BIGINT NULL,
  `jerarquiaid` BIGINT NULL,
  `monjeid` BIGINT NULL,
  `especializacionid` BIGINT NULL,
  `almacenamiento` VARCHAR(255) NULL,
  `apellido1` VARCHAR(255) NULL,
  `apellido2` VARCHAR(255) NULL,
  `estado` VARCHAR(255) NULL,
  `fecha_nacimiento` DATETIME NULL,
  `fecha_entrada` DATETIME NULL,
  `fecha_fallecimiento` DATETIME NULL,
  `nombre` VARCHAR(255) NULL,
  `santo` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `monje_alimentacion` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `id` BIGINT NULL,
  `monjeid` BIGINT NULL,
  `comer_familiaid_1` VARCHAR(255) NULL,
  `comer_familiaid_2` VARCHAR(255) NULL,
  `comer_familiaid_3` VARCHAR(255) NULL,
  `comer_familiaid_4` VARCHAR(255) NULL,
  `comer_familiaid_5` VARCHAR(255) NULL,
  `hidratos_carbono` VARCHAR(255) NULL,
  `lipidos` VARCHAR(255) NULL,
  `proteinas` VARCHAR(255) NULL,
  `salud` VARCHAR(255) NULL,
  `ultima_comida` VARCHAR(255) NULL,
  `vitaminas` INT NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `monje_cementerio` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `abadiaid` BIGINT NULL,
  `id` BIGINT NULL,
  `jerarquiaid` BIGINT NULL,
  `muerte_literalid` BIGINT NULL,
  `estado` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `monje_enfermedad` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `id` BIGINT NULL,
  `monjeid` BIGINT NULL,
  `fecha_fin` DATETIME NULL,
  `fecha_inicio` DATETIME NULL,
  `nivel` INT NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `monje_expulsado` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `fecha_expulsion` DATETIME NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `monje_popularidad_votos` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `abadiaid` BIGINT NULL,
  `monjeid` BIGINT NULL,
  `fecha` DATETIME NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `monje_visita` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `abadiaid` BIGINT NULL,
  `id` BIGINT NULL,
  `monjeid` BIGINT NULL,
  `abadiaid_destino` VARCHAR(255) NULL,
  `coste` DOUBLE NULL,
  `dummy` VARCHAR(255) NULL,
  `fecha_llegada_destino` DATETIME NULL,
  `fecha_llegada_origen` DATETIME NULL,
  `fecha_partida_destino` DATETIME NULL,
  `fecha_partida_origen` DATETIME NULL,
  `tipo_visita` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `monje_visita_animal` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `animalid` BIGINT NULL,
  `id` BIGINT NULL,
  `monjeid` BIGINT NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `obispado` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `abadiaid` BIGINT NULL,
  `monjeid` BIGINT NULL,
  `regionid` BIGINT NULL,
  `fecha_proclamacion` DATETIME NULL,
  `fecha_votacion` DATETIME NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `obispado_candidatos` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `abadiaid` BIGINT NULL,
  `id` BIGINT NULL,
  `descripcion` TEXT NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `obispado_voto` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `id` BIGINT NULL,
  `abadiaid_voto` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `orden_eclesiastica` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `id` BIGINT NULL,
  `ordenid` BIGINT NULL,
  `descripcion` TEXT NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `peticion_bloqueo` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `estado` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `peticion_bloqueo_voto` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `peticionid` BIGINT NULL,
  `usuarioid` BIGINT NULL,
  `fecha_creacion` DATETIME NULL,
  `voto` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `phpbb_users` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `id` BIGINT NULL,
  `user_id` BIGINT NULL,
  `user_active` VARCHAR(255) NULL,
  `user_email` VARCHAR(255) NULL,
  `user_lang` VARCHAR(255) NULL,
  `user_password` VARCHAR(255) NULL,
  `user_regdate` VARCHAR(255) NULL,
  `username` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `procesos` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `procesoid` BIGINT NULL,
  `clase` VARCHAR(255) NULL,
  `descripcion` TEXT NULL,
  `fechalastrun` DATETIME NULL,
  `fecharealstart` DATETIME NULL,
  `frecuencia` VARCHAR(255) NULL,
  `hora` DATETIME NULL,
  `parametros` VARCHAR(255) NULL,
  `proceso` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `procesos_mensajes` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `descripcion` TEXT NULL,
  `fecha_abbatia` DATETIME NULL,
  `fecha_real` DATETIME NULL,
  `tipo` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `procesos_status` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `activo` TINYINT(1) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `propiedad` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `propiedadid` BIGINT NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `propiedad_valor` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `claveid` BIGINT NULL,
  `propiedadid` BIGINT NULL,
  `valor` DOUBLE NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `publicidad` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `id` BIGINT NULL,
  `tipo` INT NULL,
  `activo` INT NULL,
  `pais` VARCHAR(8) NULL,
  `visualizar_total` DOUBLE NULL,
  `imagen` VARCHAR(255) NULL,
  `url` VARCHAR(512) NULL,
  `hint` VARCHAR(255) NULL,
  `stats_clicks` VARCHAR(255) NULL,
  `stats_visto` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `publicidad_libros` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `autor` VARCHAR(255) NULL,
  `isbn` VARCHAR(255) NULL,
  `titulo` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `recurso` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `abadiaid` BIGINT NULL,
  `id` BIGINT NULL,
  `recursoid` BIGINT NULL,
  `cantidad` INT NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `recurso_tipo` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `literalid` BIGINT NULL,
  `recursoid` BIGINT NULL,
  `edificioid_almacen` VARCHAR(255) NULL,
  `unidad_medida` VARCHAR(255) NULL,
  `volumen` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `recursos` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `cantidad` INT NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `region` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `id` BIGINT NULL,
  `idiomaid` BIGINT NULL,
  `regionid` BIGINT NULL,
  `descripcion` TEXT NULL,
  `nom` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `region_ciudades` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `regionid` BIGINT NULL,
  `nombre` VARCHAR(255) NULL,
  `temporal` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `region_clima` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `regionid` BIGINT NULL,
  `mes` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `region_distancia` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `distancia_campo` VARCHAR(255) NULL,
  `distancia_mar` VARCHAR(255) NULL,
  `distancia_montanyas` VARCHAR(255) NULL,
  `regionid_origen` INT NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `reliquias` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `abadiaid` BIGINT NULL,
  `reliquiaid` BIGINT NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `reliquias_tipo` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `literalid` BIGINT NULL,
  `reliquiaid` BIGINT NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `salario` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `monedas` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `sicario` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `id` BIGINT NULL,
  `abadiaid_contrato` VARCHAR(255) NULL,
  `abadiaid_destino` VARCHAR(255) NULL,
  `estado` VARCHAR(255) NULL,
  `fecha_contrato` DATETIME NULL,
  `monjeid_destino` VARCHAR(255) NULL,
  `moral` VARCHAR(255) NULL,
  `precio` DOUBLE NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `solicitud` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `id` BIGINT NULL,
  `solicitudid` BIGINT NULL,
  `estado` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `solicitud_voto` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `abadiaid` BIGINT NULL,
  `id` BIGINT NULL,
  `solicitudid` BIGINT NULL,
  `voto` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tablas` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(255) NULL,
  `idiomaid` BIGINT NULL,
  `orden` BIGINT NULL,
  `descripcion` TEXT NULL,
  `subcodigo` VARCHAR(255) NULL,
  `valor` DOUBLE NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `unidad_medida` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `idiomaid` BIGINT NULL,
  `unidad_desc` VARCHAR(255) NULL,
  `unidad_medida` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `usuario` (
  `_pk` BIGINT NULL,
  `id` BIGINT NULL,
  `idiomaid` BIGINT NULL,
  `usuarioid` BIGINT NOT NULL AUTO_INCREMENT,
  `abadia_congelada` VARCHAR(255) NULL,
  `acepta_normas` TINYINT(1) NULL,
  `apellido1` VARCHAR(255) NULL,
  `apellido2` VARCHAR(255) NULL,
  `contrasena` VARCHAR(255) NULL,
  `conectado` INT NULL,
  `edad` INT NULL,
  `email` VARCHAR(255) NULL,
  `fechaalta` DATETIME NULL,
  `web` VARCHAR(255) NULL,
  `icq` VARCHAR(255) NULL,
  `ip_alta` VARCHAR(255) NULL,
  `ip_ultima` VARCHAR(255) NULL,
  `nick` VARCHAR(255) NULL,
  `nombre` VARCHAR(255) NULL,
  `pais` VARCHAR(255) NULL,
  `registrado` VARCHAR(255) NULL,
  `reintentos` VARCHAR(255) NULL,
  `sexo` VARCHAR(255) NULL,
  `ultimaconexion` VARCHAR(255) NULL,
  `usuario_tipo` VARCHAR(255) NULL,
  PRIMARY KEY (`usuarioid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `usuario_bloqueo` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `id` BIGINT NULL,
  `usuarioid` BIGINT NULL,
  `dias_bloqueo` INT NULL,
  `fecha_bloqueo` DATETIME NULL,
  `motivo` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `usuario_ip` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `fecha_acceso` DATETIME NULL,
  `ip` VARCHAR(255) NULL,
  `logado` VARCHAR(255) NULL,
  `nick` VARCHAR(255) NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `novedades` (
  `_pk` BIGINT NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME NULL,
  `mensaje` TEXT NULL,
  `mostrar` INT NULL,
  PRIMARY KEY (`_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
