-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-09-2024 a las 23:17:46
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda_mascotas`
--
CREATE DATABASE IF NOT EXISTS `tienda_mascotas` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tienda_mascotas`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `dni` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `telefono` bigint(20) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `contactoAlternativo` bigint(20) NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `dni`, `nombre`, `apellido`, `telefono`, `direccion`, `contactoAlternativo`, `activo`) VALUES
(1, 12345678, 'Juan', 'Pérez', 1234567890, 'Calle Falsa 123', 987654321, 1),
(2, 23456789, 'María', 'López', 2345678901, 'Avenida Siempreviva 456', 876543210, 1),
(3, 34567890, 'Carlos', 'Gómez', 3456789012, 'Boulevard Principal 789', 765432109, 1),
(4, 45678901, 'Ana', 'Rodríguez', 4567890123, 'Calle Verde 100', 654321098, 1),
(5, 56789012, 'Pedro', 'Martínez', 5678901234, 'Avenida Azul 200', 543210987, 1),
(6, 67890123, 'Lucía', 'Fernández', 6789012345, 'Boulevard Amarillo 300', 432109876, 1),
(7, 78901234, 'Sofía', 'García', 7890123456, 'Calle Roja 400', 321098765, 1),
(8, 89012345, 'Diego', 'Sánchez', 8901234567, 'Avenida Negra 500', 210987654, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascota`
--

CREATE TABLE `mascota` (
  `idMascota` int(11) NOT NULL,
  `alias` varchar(30) NOT NULL,
  `sexo` varchar(30) NOT NULL,
  `especie` varchar(30) NOT NULL,
  `raza` varchar(30) NOT NULL,
  `colorPelo` varchar(50) NOT NULL,
  `fechaNac` date NOT NULL,
  `idCliente` int(11) NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mascota`
--

INSERT INTO `mascota` (`idMascota`, `alias`, `sexo`, `especie`, `raza`, `colorPelo`, `fechaNac`, `idCliente`, `activo`) VALUES
(1, 'Max', 'Macho', 'Perro', 'Labrador', 'Negro', '2019-03-15', 1, 1),
(2, 'Luna', 'Hembra', 'Gato', 'Siames', 'Gris', '2020-07-20', 2, 1),
(3, 'Rex', 'Macho', 'Perro', 'Bulldog', 'Blanco', '2018-11-30', 3, 1),
(4, 'Rocky', 'Macho', 'Canino', 'Pastor Alemán', 'Marrón', '2017-05-10', 4, 1),
(5, 'Mia', 'Hembra', 'Gato', 'Persa', 'Blanco', '2019-01-05', 5, 1),
(6, 'Toby', 'Macho', 'Canino', 'Cocker Spaniel', 'Dorado', '2020-11-25', 6, 1),
(7, 'Simba', 'Macho', 'Gato', 'Bengalí', 'Naranja', '2021-02-10', 7, 1),
(8, 'Nala', 'Hembra', 'Canino', 'Golden Retriever', 'Rubio', '2018-09-09', 8, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tratamiento`
--

CREATE TABLE `tratamiento` (
  `idTratamiento` int(11) NOT NULL,
  `descripcion` varchar(70) NOT NULL,
  `medicamento` varchar(50) NOT NULL,
  `importe` double NOT NULL,
  `tipoTratamiento` varchar(30) NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tratamiento`
--

INSERT INTO `tratamiento` (`idTratamiento`, `descripcion`, `medicamento`, `importe`, `tipoTratamiento`, `activo`) VALUES
(1, 'Vacuna contra la rabia', 'Vacuna', 500, 'Vacunación', 1),
(2, 'Desparasitación interna', 'Antiparasitario', 300, 'Desparasitación', 1),
(3, 'Limpieza dental', 'Anestesia', 1200, 'Higiene', 1),
(4, 'Corte de uñas', 'Anestesia leve', 200, 'Higiene', 1),
(5, 'Vacuna antirrábica', 'Vacuna', 600, 'Vacunación', 1),
(6, 'Antipulgas y garrapatas', 'Pipeta', 450, 'Desparasitación', 1),
(7, 'Limpieza de oídos', 'Solución limpiadora', 350, 'Higiene', 1),
(8, 'Castración', 'Anestesia total', 2500, 'Cirugía', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visita`
--

CREATE TABLE `visita` (
  `idVisita` int(11) NOT NULL,
  `idMascota` int(11) NOT NULL,
  `fechaVisita` date NOT NULL,
  `detalle` varchar(50) NOT NULL,
  `peso` double NOT NULL,
  `idTratamiento` int(11) NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `visita`
--

INSERT INTO `visita` (`idVisita`, `idMascota`, `fechaVisita`, `detalle`, `peso`, `idTratamiento`, `activo`) VALUES
(1, 1, '2023-09-01', 'Revisión general', 25.5, 1, 1),
(2, 2, '2023-09-10', 'Desparasitación', 4.3, 2, 1),
(3, 3, '2023-09-15', 'Limpieza dental', 28, 3, 1),
(19, 4, '2024-09-25', 'Vacuna antirrábica', 30.2, 2, 1),
(20, 5, '2023-08-30', 'Corte de uñas', 3.1, 4, 1),
(21, 6, '2024-09-25', 'Limpieza de oídos', 15.4, 5, 1),
(22, 7, '2023-09-07', 'Vacuna antirrábica', 6.3, 2, 1),
(23, 8, '2024-09-25', 'Antipulgas y garrapatas', 27.6, 3, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD UNIQUE KEY `dni` (`dni`);

--
-- Indices de la tabla `mascota`
--
ALTER TABLE `mascota`
  ADD PRIMARY KEY (`idMascota`),
  ADD KEY `idCliente` (`idCliente`);

--
-- Indices de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  ADD PRIMARY KEY (`idTratamiento`);

--
-- Indices de la tabla `visita`
--
ALTER TABLE `visita`
  ADD PRIMARY KEY (`idVisita`),
  ADD KEY `idMascota` (`idMascota`),
  ADD KEY `idTratamiento` (`idTratamiento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `mascota`
--
ALTER TABLE `mascota`
  MODIFY `idMascota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tratamiento`
--
ALTER TABLE `tratamiento`
  MODIFY `idTratamiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `visita`
--
ALTER TABLE `visita`
  MODIFY `idVisita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `mascota`
--
ALTER TABLE `mascota`
  ADD CONSTRAINT `mascota_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`);

--
-- Filtros para la tabla `visita`
--
ALTER TABLE `visita`
  ADD CONSTRAINT `visita_ibfk_1` FOREIGN KEY (`idMascota`) REFERENCES `mascota` (`idMascota`),
  ADD CONSTRAINT `visita_ibfk_2` FOREIGN KEY (`idTratamiento`) REFERENCES `tratamiento` (`idTratamiento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
