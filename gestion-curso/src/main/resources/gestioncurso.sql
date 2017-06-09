-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-06-2017 a las 13:35:37
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gestioncurso`
--
CREATE DATABASE IF NOT EXISTS `gestioncurso` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `gestioncurso`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `cursoCreate`$$
CREATE DEFINER=`admin`@`localhost` PROCEDURE `cursoCreate` (IN `pnombre` VARCHAR(40), IN `pcodCodigo` VARCHAR(10), OUT `pcodigo` INT)  NO SQL
BEGIN
INSERT	INTO curso(nombre,codCurso)
VALUES(LOWER(pnombre),LOWER(pcodCurso));
SET pcodigo = LAST_INSERT_ID();

END$$

DROP PROCEDURE IF EXISTS `cursoDelete`$$
CREATE DEFINER=`admin`@`localhost` PROCEDURE `cursoDelete` (IN `pcodigo` INT)  NO SQL
BEGIN

DELETE FROM curso WHERE codigo = pcodigo;

END$$

DROP PROCEDURE IF EXISTS `cursogetAll`$$
CREATE DEFINER=`admin`@`localhost` PROCEDURE `cursogetAll` ()  NO SQL
BEGIN
	SELECT `codigo`, `nombre`, `codCurso` 
	FROM `curso`;
END$$

DROP PROCEDURE IF EXISTS `cursogetById`$$
CREATE DEFINER=`admin`@`localhost` PROCEDURE `cursogetById` (IN `pcodigo` INT)  NO SQL
BEGIN

    SELECT `codigo` as codigo, `nombre`, `codCurso` 
    FROM `curso`
	WHERE codigo = pcodigo;

END$$

DROP PROCEDURE IF EXISTS `cursoUpdate`$$
CREATE DEFINER=`admin`@`localhost` PROCEDURE `cursoUpdate` (IN `pcodigo` INT, IN `pnombre` VARCHAR(40), IN `pcodCurso` VARCHAR(10))  NO SQL
BEGIN

UPDATE curso 
SET nombre = LOWER(pnombre),codCurso = LOWER(pcodCurso)
WHERE codigo = pcodigo;


END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

DROP TABLE IF EXISTS `curso`;
CREATE TABLE `curso` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `codCurso` varchar(10) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`codigo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `curso`
--
ALTER TABLE `curso`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
