-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 17-03-2025 a las 02:03:00
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `MI_RUTA_SEGURA`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CONTRATO`
--

CREATE TABLE `CONTRATO` (
  `id_contrato` int(11) NOT NULL,
  `salario` int(11) NOT NULL,
  `tipo_contrato` varchar(50) NOT NULL,
  `fecha_contrato` date NOT NULL,
  `lugar_de_trabajo` varchar(50) NOT NULL,
  `cargo` varchar(50) NOT NULL,
  `eps` varchar(50) NOT NULL,
  `arl` varchar(50) NOT NULL,
  `afp` varchar(50) NOT NULL,
  `id_empleados` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EMPLEADOS`
--

CREATE TABLE `EMPLEADOS` (
  `id_empleados` int(11) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `tipo_de_identificacion` varchar(50) NOT NULL,
  `numero_de_documento` int(11) NOT NULL,
  `fecha_de_expedicion` date NOT NULL,
  `lugar_de_nacimiento` varchar(50) NOT NULL,
  `fecha_de_nacimiento` date NOT NULL,
  `edad` int(11) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `escolaridad` varchar(50) NOT NULL,
  `profesion` varchar(50) NOT NULL,
  `correo_electronico` varchar(50) NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EMPRESA`
--

CREATE TABLE `EMPRESA` (
  `id_empresa` int(11) NOT NULL,
  `razon_social` varchar(50) NOT NULL,
  `tipo_contribuyente` varchar(50) NOT NULL,
  `tipo_de_identificacion_tributaria` varchar(50) NOT NULL,
  `numero_de_identificacion_tributaria` int(11) NOT NULL,
  `tamano` varchar(50) NOT NULL,
  `actividad_economica` varchar(50) NOT NULL,
  `representante_legal` varchar(50) NOT NULL,
  `sitio_web` varchar(50) NOT NULL,
  `fecha_afiliacion_arl` date NOT NULL,
  `arl` varchar(50) NOT NULL,
  `empleados_directos` int(11) NOT NULL,
  `empleados_temporales` int(11) NOT NULL,
  `numero_de_trabajadores` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ESTADO`
--

CREATE TABLE `ESTADO` (
  `tipo_estado` varchar(50) NOT NULL,
  `activo` varchar(50) NOT NULL,
  `inactivo` varchar(50) NOT NULL,
  `id_empleados` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EVIDENCIA`
--

CREATE TABLE `EVIDENCIA` (
  `id_evidencia` int(11) NOT NULL,
  `nombre_evidencia` varchar(50) NOT NULL,
  `tipo_archivo` varchar(50) NOT NULL,
  `nivel_de_riesgo` varchar(50) NOT NULL,
  `tipo_normatividad` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `NORMATIVIDADES`
--

CREATE TABLE `NORMATIVIDADES` (
  `tipo_normatividad` varchar(50) NOT NULL,
  `decreto` varchar(50) NOT NULL,
  `ley` varchar(50) NOT NULL,
  `resolucion` varchar(50) NOT NULL,
  `norma` varchar(50) NOT NULL,
  `circular` varchar(50) NOT NULL,
  `nivel_de_riesgo` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `RIESGO`
--

CREATE TABLE `RIESGO` (
  `nivel_de_riesgo` varchar(50) NOT NULL,
  `I_II_III` varchar(50) NOT NULL,
  `IV` varchar(50) NOT NULL,
  `IV_V` varchar(50) NOT NULL,
  `V` varchar(50) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `id_empleados` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ROL`
--

CREATE TABLE `ROL` (
  `tipo_rol` varchar(50) NOT NULL,
  `administrador` varchar(50) NOT NULL,
  `empleado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `UBICACION`
--

CREATE TABLE `UBICACION` (
  `pais` varchar(50) NOT NULL,
  `departamento` varchar(50) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `id_empleados` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `USUARIO`
--

CREATE TABLE `USUARIO` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `rol_usuario` varchar(50) NOT NULL,
  `contraseña` varchar(50) NOT NULL,
  `id_empleados` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `CONTRATO`
--
ALTER TABLE `CONTRATO`
  ADD PRIMARY KEY (`id_contrato`),
  ADD KEY `id_empleados` (`id_empleados`);

--
-- Indices de la tabla `EMPLEADOS`
--
ALTER TABLE `EMPLEADOS`
  ADD PRIMARY KEY (`id_empleados`),
  ADD KEY `id_empresa` (`id_empresa`);

--
-- Indices de la tabla `EMPRESA`
--
ALTER TABLE `EMPRESA`
  ADD PRIMARY KEY (`id_empresa`);

--
-- Indices de la tabla `ESTADO`
--
ALTER TABLE `ESTADO`
  ADD PRIMARY KEY (`tipo_estado`),
  ADD KEY `id_empresa` (`id_empresa`),
  ADD KEY `id_empleados` (`id_empleados`);

--
-- Indices de la tabla `EVIDENCIA`
--
ALTER TABLE `EVIDENCIA`
  ADD PRIMARY KEY (`id_evidencia`),
  ADD KEY `nivel_de_riesgo` (`nivel_de_riesgo`),
  ADD KEY `tipo_normatividad` (`tipo_normatividad`);

--
-- Indices de la tabla `NORMATIVIDADES`
--
ALTER TABLE `NORMATIVIDADES`
  ADD PRIMARY KEY (`tipo_normatividad`),
  ADD KEY `nivel_de_riesgo` (`nivel_de_riesgo`);

--
-- Indices de la tabla `RIESGO`
--
ALTER TABLE `RIESGO`
  ADD PRIMARY KEY (`nivel_de_riesgo`),
  ADD KEY `id_empresa` (`id_empresa`),
  ADD KEY `id_empleados` (`id_empleados`);

--
-- Indices de la tabla `ROL`
--
ALTER TABLE `ROL`
  ADD PRIMARY KEY (`tipo_rol`);

--
-- Indices de la tabla `UBICACION`
--
ALTER TABLE `UBICACION`
  ADD KEY `id_empresa` (`id_empresa`),
  ADD KEY `id_empleados` (`id_empleados`);

--
-- Indices de la tabla `USUARIO`
--
ALTER TABLE `USUARIO`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_empleados` (`id_empleados`),
  ADD KEY `id_empresa` (`id_empresa`),
  ADD KEY `rol_usuario` (`rol_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `CONTRATO`
--
ALTER TABLE `CONTRATO`
  MODIFY `id_contrato` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `EMPLEADOS`
--
ALTER TABLE `EMPLEADOS`
  MODIFY `id_empleados` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `EMPRESA`
--
ALTER TABLE `EMPRESA`
  MODIFY `id_empresa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `EVIDENCIA`
--
ALTER TABLE `EVIDENCIA`
  MODIFY `id_evidencia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `USUARIO`
--
ALTER TABLE `USUARIO`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `CONTRATO`
--
ALTER TABLE `CONTRATO`
  ADD CONSTRAINT `contrato_ibfk_1` FOREIGN KEY (`id_empleados`) REFERENCES `EMPLEADOS` (`id_empleados`);

--
-- Filtros para la tabla `EMPLEADOS`
--
ALTER TABLE `EMPLEADOS`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`id_empresa`) REFERENCES `EMPRESA` (`id_empresa`);

--
-- Filtros para la tabla `ESTADO`
--
ALTER TABLE `ESTADO`
  ADD CONSTRAINT `estado_ibfk_1` FOREIGN KEY (`id_empresa`) REFERENCES `EMPRESA` (`id_empresa`),
  ADD CONSTRAINT `estado_ibfk_2` FOREIGN KEY (`id_empleados`) REFERENCES `EMPLEADOS` (`id_empleados`);

--
-- Filtros para la tabla `EVIDENCIA`
--
ALTER TABLE `EVIDENCIA`
  ADD CONSTRAINT `evidencia_ibfk_1` FOREIGN KEY (`nivel_de_riesgo`) REFERENCES `RIESGO` (`nivel_de_riesgo`),
  ADD CONSTRAINT `evidencia_ibfk_2` FOREIGN KEY (`tipo_normatividad`) REFERENCES `NORMATIVIDADES` (`tipo_normatividad`);

--
-- Filtros para la tabla `NORMATIVIDADES`
--
ALTER TABLE `NORMATIVIDADES`
  ADD CONSTRAINT `normatividades_ibfk_1` FOREIGN KEY (`nivel_de_riesgo`) REFERENCES `RIESGO` (`nivel_de_riesgo`);

--
-- Filtros para la tabla `RIESGO`
--
ALTER TABLE `RIESGO`
  ADD CONSTRAINT `riesgo_ibfk_1` FOREIGN KEY (`id_empresa`) REFERENCES `EMPRESA` (`id_empresa`),
  ADD CONSTRAINT `riesgo_ibfk_2` FOREIGN KEY (`id_empleados`) REFERENCES `EMPLEADOS` (`id_empleados`);

--
-- Filtros para la tabla `UBICACION`
--
ALTER TABLE `UBICACION`
  ADD CONSTRAINT `ubicacion_ibfk_1` FOREIGN KEY (`id_empresa`) REFERENCES `EMPRESA` (`id_empresa`),
  ADD CONSTRAINT `ubicacion_ibfk_2` FOREIGN KEY (`id_empleados`) REFERENCES `EMPLEADOS` (`id_empleados`);

--
-- Filtros para la tabla `USUARIO`
--
ALTER TABLE `USUARIO`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_empleados`) REFERENCES `EMPLEADOS` (`id_empleados`),
  ADD CONSTRAINT `usuario_ibfk_3` FOREIGN KEY (`id_empresa`) REFERENCES `EMPRESA` (`id_empresa`),
  ADD CONSTRAINT `usuario_ibfk_4` FOREIGN KEY (`rol_usuario`) REFERENCES `ROL` (`tipo_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
