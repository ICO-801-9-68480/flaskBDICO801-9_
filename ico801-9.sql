-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:8889
-- Tiempo de generación: 17-04-2026 a las 16:24:11
-- Versión del servidor: 8.0.44
-- Versión de PHP: 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ico801-9`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alembic_version`
--

CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `id` int NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apaterno` varchar(255) NOT NULL,
  `amaterno` varchar(255) NOT NULL,
  `edad` int NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`id`, `nombre`, `apaterno`, `amaterno`, `edad`, `email`, `created_date`) VALUES
(1, 'Jorge Mario Albert', 'Mende', 'Vazque', 22, '68136tec@col.com', '2026-04-10 23:08:48'),
(5, 'Enzo ', 'Ferreira', 'Vazquez', 20, '68165tec@col.com', '2026-04-17 08:28:03'),
(6, 'Antonio', 'Montalvo', 'Ramirez', 21, '68198tec@col.com', '2026-04-17 08:28:22'),
(8, 'Jorge', 'garcia', 'Piña', 25, '68187tec@col.com', '2026-04-17 08:29:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `id` int NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text,
  `maestro_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`id`, `nombre`, `descripcion`, `maestro_id`) VALUES
(1, 'Fisica II', 'movimientos y velocidad', 1),
(3, 'Estadistica', 'Media, desviacion estandar', 2),
(4, 'Matematicas II', 'general', 3),
(5, 'Psicologia', 'Saca de las locuras', 3),
(6, 'Quimica', 'Ciencia', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripciones`
--

CREATE TABLE `inscripciones` (
  `id` int NOT NULL,
  `alumno_id` int NOT NULL,
  `curso_id` int NOT NULL,
  `fecha_inscripcion` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `inscripciones`
--

INSERT INTO `inscripciones` (`id`, `alumno_id`, `curso_id`, `fecha_inscripcion`) VALUES
(1, 1, 1, '2026-04-11 16:09:37'),
(3, 5, 1, '2026-04-17 08:34:59'),
(4, 6, 1, '2026-04-17 08:35:06'),
(7, 5, 3, '2026-04-17 08:39:12'),
(8, 1, 3, '2026-04-17 08:39:24'),
(10, 6, 3, '2026-04-17 08:39:55'),
(11, 8, 4, '2026-04-17 09:20:51'),
(12, 1, 6, '2026-04-17 10:19:50'),
(13, 5, 6, '2026-04-17 10:19:56'),
(14, 8, 6, '2026-04-17 10:20:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maestros`
--

CREATE TABLE `maestros` (
  `matricula` int NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `especialidad` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `maestros`
--

INSERT INTO `maestros` (`matricula`, `nombre`, `apellidos`, `email`, `especialidad`) VALUES
(1, 'David', 'Montolla', '01@tec.com', 'ingeniero en computacion'),
(2, 'Mario', 'Mendez', '02@tec.com', 'Ingeniero en quimica'),
(3, 'daniel', 'alferez', '03@tec.com', 'Ingeniero en Minas');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alembic_version`
--
ALTER TABLE `alembic_version`
  ADD PRIMARY KEY (`version_num`);

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cursos_maestro_id` (`maestro_id`);

--
-- Indices de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_inscripciones_alumno_id` (`alumno_id`),
  ADD KEY `idx_inscripciones_curso_id` (`curso_id`);

--
-- Indices de la tabla `maestros`
--
ALTER TABLE `maestros`
  ADD PRIMARY KEY (`matricula`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `maestros`
--
ALTER TABLE `maestros`
  MODIFY `matricula` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001002;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD CONSTRAINT `fk_cursos_maestro` FOREIGN KEY (`maestro_id`) REFERENCES `maestros` (`matricula`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD CONSTRAINT `fk_inscripciones_alumno` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_inscripciones_curso` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
