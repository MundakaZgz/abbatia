-- Stubs de rutinas llamadas desde Java
-- Devuelven datasets vacíos/minimales para permitir arranque inicial
DELIMITER $$

DROP PROCEDURE IF EXISTS `alimentar_animal`$$
CREATE PROCEDURE `alimentar_animal`(IN p1 VARCHAR(255), IN p2 VARCHAR(255), IN p3 VARCHAR(255), IN p4 VARCHAR(255))
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `buscar_abadias`$$
CREATE PROCEDURE `buscar_abadias`(IN p1 VARCHAR(255))
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `cargarproduccionganaderiaporabadiaalimentos`$$
CREATE PROCEDURE `cargarproduccionganaderiaporabadiaalimentos`()
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `cargarproduccionganaderiaporabadiarecursos`$$
CREATE PROCEDURE `cargarproduccionganaderiaporabadiarecursos`()
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `cargarproductosventa`$$
CREATE PROCEDURE `cargarproductosventa`(IN p1 VARCHAR(255), IN p2 VARCHAR(255), IN p3 VARCHAR(255))
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `cargarstressporedificio`$$
CREATE PROCEDURE `cargarstressporedificio`()
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `cargarstressporedificioregion`$$
CREATE PROCEDURE `cargarstressporedificioregion`(IN p1 VARCHAR(255))
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `cargarvolumenventa`$$
CREATE PROCEDURE `cargarvolumenventa`(IN p1 VARCHAR(255))
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `eliminaranimalesmuertos`$$
CREATE PROCEDURE `eliminaranimalesmuertos`()
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `eliminardatosmonje`$$
CREATE PROCEDURE `eliminardatosmonje`(IN p1 VARCHAR(255))
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `eliminardatosmonjesmuertos`$$
CREATE PROCEDURE `eliminardatosmonjesmuertos`()
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `eliminartodoabadia`$$
CREATE PROCEDURE `eliminartodoabadia`(IN p1 VARCHAR(255))
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `gestionpeticionbloqueo`$$
CREATE PROCEDURE `gestionpeticionbloqueo`(IN p1 VARCHAR(255))
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `modificarsaludmonjesporedad`$$
CREATE PROCEDURE `modificarsaludmonjesporedad`(IN p1 VARCHAR(255), IN p2 VARCHAR(255), IN p3 VARCHAR(255), IN p4 VARCHAR(255))
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `recuperarabadiasconlibros`$$
CREATE PROCEDURE `recuperarabadiasconlibros`()
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `recuperarabadiasconlibrosporregion`$$
CREATE PROCEDURE `recuperarabadiasconlibrosporregion`(IN p1 VARCHAR(255))
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `recuperarabadiasmantenimientoedificios`$$
CREATE PROCEDURE `recuperarabadiasmantenimientoedificios`()
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `recuperaractividadesproduccion`$$
CREATE PROCEDURE `recuperaractividadesproduccion`()
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `recuperaranimalesmercadonivel`$$
CREATE PROCEDURE `recuperaranimalesmercadonivel`(IN p1 VARCHAR(255))
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `recuperaranimalesparir`$$
CREATE PROCEDURE `recuperaranimalesparir`(IN p1 VARCHAR(255))
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `recuperaranimalesproduccionalimentos`$$
CREATE PROCEDURE `recuperaranimalesproduccionalimentos`()
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `recuperaranimalesproduccionrecursos`$$
CREATE PROCEDURE `recuperaranimalesproduccionrecursos`()
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `recuperarcategoriasconlibros`$$
CREATE PROCEDURE `recuperarcategoriasconlibros`()
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `recuperarconsumosalimentofamilia`$$
CREATE PROCEDURE `recuperarconsumosalimentofamilia`(IN p1 VARCHAR(255), IN p2 VARCHAR(255))
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `recuperaredificiosmantenimiento`$$
CREATE PROCEDURE `recuperaredificiosmantenimiento`()
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `recuperaredificiossaturadosrecursos`$$
CREATE PROCEDURE `recuperaredificiossaturadosrecursos`()
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `recuperarhistoricocomprasalimentos`$$
CREATE PROCEDURE `recuperarhistoricocomprasalimentos`(IN p1 VARCHAR(255), IN p2 VARCHAR(255))
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `recuperarhistoricocomprasanimales`$$
CREATE PROCEDURE `recuperarhistoricocomprasanimales`(IN p1 VARCHAR(255), IN p2 VARCHAR(255))
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `recuperarhistoricocomprasrecursos`$$
CREATE PROCEDURE `recuperarhistoricocomprasrecursos`(IN p1 VARCHAR(255), IN p2 VARCHAR(255))
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `recuperarhistoricoventasalimentos`$$
CREATE PROCEDURE `recuperarhistoricoventasalimentos`(IN p1 VARCHAR(255), IN p2 VARCHAR(255))
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `recuperarhistoricoventasanimales`$$
CREATE PROCEDURE `recuperarhistoricoventasanimales`(IN p1 VARCHAR(255), IN p2 VARCHAR(255))
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `recuperarhistoricoventasrecursos`$$
CREATE PROCEDURE `recuperarhistoricoventasrecursos`(IN p1 VARCHAR(255), IN p2 VARCHAR(255))
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `recuperaridiomasconlibros`$$
CREATE PROCEDURE `recuperaridiomasconlibros`()
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `recuperarlibrosactivos`$$
CREATE PROCEDURE `recuperarlibrosactivos`()
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `recuperarlibroscopiando`$$
CREATE PROCEDURE `recuperarlibroscopiando`(IN p1 VARCHAR(255), IN p2 VARCHAR(255))
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `recuperarlibrospropios`$$
CREATE PROCEDURE `recuperarlibrospropios`(IN p1 VARCHAR(255), IN p2 VARCHAR(255))
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `recuperarlibrosregion`$$
CREATE PROCEDURE `recuperarlibrosregion`(IN p1 VARCHAR(255), IN p2 VARCHAR(255))
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `recuperarlibrosregionfiltro`$$
CREATE PROCEDURE `recuperarlibrosregionfiltro`(IN p1 VARCHAR(255), IN p2 VARCHAR(255), IN p3 VARCHAR(255), IN p4 VARCHAR(255), IN p5 VARCHAR(255), IN p6 VARCHAR(255))
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `recuperarlibrostipo`$$
CREATE PROCEDURE `recuperarlibrostipo`(IN p1 VARCHAR(255))
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `recuperarlibrostodos`$$
CREATE PROCEDURE `recuperarlibrostodos`(IN p1 VARCHAR(255))
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `recuperarlibrostodosfiltro`$$
CREATE PROCEDURE `recuperarlibrostodosfiltro`(IN p1 VARCHAR(255), IN p2 VARCHAR(255), IN p3 VARCHAR(255), IN p4 VARCHAR(255), IN p5 VARCHAR(255), IN p6 VARCHAR(255))
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `recuperarmachos`$$
CREATE PROCEDURE `recuperarmachos`(IN p1 VARCHAR(255), IN p2 VARCHAR(255), IN p3 VARCHAR(255))
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `recuperarmonjesactividadabadia`$$
CREATE PROCEDURE `recuperarmonjesactividadabadia`(IN p1 VARCHAR(255), IN p2 VARCHAR(255))
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `recuperarmonjesactividadperiodo`$$
CREATE PROCEDURE `recuperarmonjesactividadperiodo`(IN p1 VARCHAR(255), IN p2 VARCHAR(255))
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `recuperarmonjesactividadperiodocampo`$$
CREATE PROCEDURE `recuperarmonjesactividadperiodocampo`(IN p1 VARCHAR(255), IN p2 VARCHAR(255), IN p3 VARCHAR(255))
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `recuperarmonjesactividadregion`$$
CREATE PROCEDURE `recuperarmonjesactividadregion`(IN p1 VARCHAR(255), IN p2 VARCHAR(255), IN p3 VARCHAR(255))
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `recuperarmonjesconenfermedad`$$
CREATE PROCEDURE `recuperarmonjesconenfermedad`()
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `recuperarmonjesenfermos`$$
CREATE PROCEDURE `recuperarmonjesenfermos`(IN p1 VARCHAR(255))
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `recuperarmonjesociosos`$$
CREATE PROCEDURE `recuperarmonjesociosos`()
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `recuperarmonjesparaenfermar`$$
CREATE PROCEDURE `recuperarmonjesparaenfermar`()
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `recuperarpeticionesbloqueo`$$
CREATE PROCEDURE `recuperarpeticionesbloqueo`(IN p1 VARCHAR(255))
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `recuperarregionesconlibros`$$
CREATE PROCEDURE `recuperarregionesconlibros`()
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `resetearalimentacionmonjes`$$
CREATE PROCEDURE `resetearalimentacionmonjes`(IN p1 VARCHAR(255))
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DROP PROCEDURE IF EXISTS `subirsaludmonjes`$$
CREATE PROCEDURE `subirsaludmonjes`()
BEGIN
  SELECT 0 AS id, '' AS descripcion LIMIT 0;
END$$

DELIMITER ;