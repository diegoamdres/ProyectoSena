-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-10-2021 a las 21:09:46
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `prueba`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `cliente_id` int(10) NOT NULL,
  `cliente_dni` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `cliente_nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `cliente_apellido` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `cliente_telefono` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `cliente_direccion` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `cliente_email` varchar(150) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`cliente_id`, `cliente_dni`, `cliente_nombre`, `cliente_apellido`, `cliente_telefono`, `cliente_direccion`, `cliente_email`) VALUES
(2, '1017204030', 'Frenly Alejandra', 'Lopez Romero', '3003584503', 'Los Andes', ''),
(3, '98135416', 'Nelson Ovidio', 'Sanchez Marcillo', '3205369620', 'Valledupar', ''),
(4, '6845256666', 'Luis Carlos', 'Torres Camargo', '3245978630', 'Valledupar', ''),
(5, '99500249', 'Juana Paula', 'Remalina Botero', '3215171307', 'Valledupar', ''),
(6, '1007781352', 'Batman Roberto', 'Camargo Salcedo', '3043869652', 'Valledupar', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle`
--

CREATE TABLE `detalle` (
  `detalle_id` int(100) NOT NULL,
  `detalle_cantidad` int(10) NOT NULL,
  `detalle_costo` decimal(10,0) NOT NULL,
  `detalle_descripcion` varchar(150) COLLATE utf8_spanish2_ci NOT NULL,
  `pedido_codigo` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `producto_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `detalle`
--

INSERT INTO `detalle` (`detalle_id`, `detalle_cantidad`, `detalle_costo`, `detalle_descripcion`, `pedido_codigo`, `producto_id`) VALUES
(10, 7, '5000', '001 Logo de Empresa', 'CP8047007-9', 2),
(15, 4, '5000', '001 Logo de Empresa', 'CP7508779-9', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `empresa_id` int(2) NOT NULL,
  `empresa_nombre` varchar(90) COLLATE utf8_spanish2_ci NOT NULL,
  `empresa_email` varchar(70) COLLATE utf8_spanish2_ci NOT NULL,
  `empresa_telefono` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `empresa_direccion` varchar(200) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`empresa_id`, `empresa_nombre`, `empresa_email`, `empresa_telefono`, `empresa_direccion`) VALUES
(1, 'Cassis Studio', 'cassisstudio@gmail.com', '3166518825', 'Valledupar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `pago_id` int(20) NOT NULL,
  `pago_total` decimal(30,2) NOT NULL,
  `pago_fecha` date NOT NULL,
  `pedido_codigo` varchar(200) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`pago_id`, `pago_total`, `pago_fecha`, `pedido_codigo`) VALUES
(13, '15000.00', '2021-10-27', 'CP8047007-9'),
(18, '10000.00', '2021-10-27', 'CP0233209-7'),
(19, '10000.00', '2021-10-27', 'CP0922356-8'),
(20, '10000.00', '2021-10-27', 'CP7508779-9');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `pedido_id` int(50) NOT NULL,
  `pedido_codigo` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `pedido_fecha_inicio` date NOT NULL,
  `pedido_hora_inicio` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `pedido_fecha_final` date NOT NULL,
  `pedido_hora_final` varchar(15) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `pedido_cantidad` int(10) NOT NULL,
  `pedido_total` decimal(30,2) NOT NULL,
  `pedido_pagado` decimal(30,2) NOT NULL,
  `pedido_estado` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `pedido_observacion` varchar(535) COLLATE utf8_spanish2_ci NOT NULL,
  `usuario_id` int(10) NOT NULL,
  `cliente_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`pedido_id`, `pedido_codigo`, `pedido_fecha_inicio`, `pedido_hora_inicio`, `pedido_fecha_final`, `pedido_hora_final`, `pedido_cantidad`, `pedido_total`, `pedido_pagado`, `pedido_estado`, `pedido_observacion`, `usuario_id`, `cliente_id`) VALUES
(10, 'CP1545600-7', '2021-10-27', '07:27 pm', '2021-10-27', NULL, 10, '50000.00', '50000.00', 'Pedido', 'Nada', 1, 2),
(13, 'CP8047007-9', '2021-10-27', '09:27 pm', '2021-10-28', NULL, 7, '35000.00', '15000.00', 'Cotizacion', 'Nada', 1, 6),
(15, 'CP9663564-6', '2021-10-27', '09:54 pm', '2021-10-30', NULL, 10, '50000.00', '50000.00', 'Pedido', 'Nada', 1, 5),
(18, 'CP0233209-7', '2021-10-27', '10:12 pm', '2021-10-28', NULL, 4, '20000.00', '10000.00', 'Pedido', 'Nada', 1, 4),
(19, 'CP0922356-8', '2021-10-27', '10:12 pm', '2021-10-28', NULL, 4, '20000.00', '10000.00', 'Pedido', 'Nada', 1, 4),
(20, 'CP7508779-9', '2021-10-27', '10:15 pm', '2021-10-28', NULL, 4, '20000.00', '10000.00', 'Pedido', '', 1, 4),
(23, 'CP7735951-11', '2021-10-28', '01:52 am', '2021-10-29', NULL, 10, '50000.00', '50000.00', 'Pedido', 'Nada', 1, 3),
(25, 'CP7169850-8', '2021-10-28', '01:58 am', '2021-10-29', NULL, 4, '20000.00', '20000.00', 'Pedido', '', 1, 3),
(26, 'CP7580004-9', '2021-10-28', '01:58 am', '2021-10-29', NULL, 4, '20000.00', '20000.00', 'Pedido', '', 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `producto_id` int(10) NOT NULL,
  `producto_codigo` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `producto_nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `producto_descripcion` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `producto_categoria` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `producto_stock` int(10) NOT NULL,
  `producto_precio` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`producto_id`, `producto_codigo`, `producto_nombre`, `producto_descripcion`, `producto_categoria`, `producto_stock`, `producto_precio`) VALUES
(2, '001', 'Logo de Empresa', 'Logo bordado de la empresa Claro', 'Bordados', 10, '5000'),
(3, '002', 'Parche de Linkin Park', 'Parche bordado de linkin park', 'Bordados', 10, '5000'),
(5, '004', 'Gorra de Mickey', 'Gorras bordadas de Mickey Mouse', 'Bordados', 15, '18000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usuario_id` int(10) NOT NULL,
  `usuario_dni` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `usuario_nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `usuario_apellido` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `usuario_telefono` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `usuario_direccion` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `usuario_email` varchar(150) COLLATE utf8_spanish2_ci NOT NULL,
  `usuario_usuario` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `usuario_clave` varchar(535) COLLATE utf8_spanish2_ci NOT NULL,
  `usuario_estado` varchar(17) COLLATE utf8_spanish2_ci NOT NULL,
  `usuario_privilegio` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usuario_id`, `usuario_dni`, `usuario_nombre`, `usuario_apellido`, `usuario_telefono`, `usuario_direccion`, `usuario_email`, `usuario_usuario`, `usuario_clave`, `usuario_estado`, `usuario_privilegio`) VALUES
(1, '1003232503', 'Diego Andres', 'Diaz Herrera', '3114116780', 'Valledupar', 'diazherrerad8@gmail.com', 'Administrador', 'dXdPK25xa21yU2I5SllIM1hoSjVkQT09', 'Activa', 1),
(4, '1065658710', 'Juan David', 'Loaiza Gomez', '3003435290', 'Valledupar', 'Jloaiza97@gmail.com', 'Almacenista', 'UDdyMWVHajRVYkVzSlRDWFdDZVNEQT09', 'Activa', 2),
(5, '1066866558', 'Natalia Yireth', 'Berbesi Lopez', '3015543380', 'Valledupar', 'Nataliaberbesi.321@gmail.com', 'Almacenista02', 'aDNYWW9TV21Ka20zQ2d4dGo5N1RHQT09', 'Activa', 2),
(6, '1063953611', 'Andres Felipe', 'Arias Romero', '3022702550', 'Valledupar', 'afarias11@misena.edu.co', 'Cajero02', 'eStwK0VnV0c1UVVPbkJ1c3lqTkZFUT09', 'Activa', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cliente_id`);

--
-- Indices de la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD PRIMARY KEY (`detalle_id`),
  ADD KEY `producto_id` (`producto_id`),
  ADD KEY `pedido_codigo` (`pedido_codigo`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`empresa_id`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`pago_id`),
  ADD KEY `pedido_codigo` (`pedido_codigo`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`pedido_id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`producto_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuario_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `cliente_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `detalle`
--
ALTER TABLE `detalle`
  MODIFY `detalle_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `empresa_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `pago_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `pedido_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `producto_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usuario_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD CONSTRAINT `detalle_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`),
  ADD CONSTRAINT `detalle_ibfk_2` FOREIGN KEY (`detalle_id`) REFERENCES `pedido` (`pedido_id`);

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`pago_id`) REFERENCES `pedido` (`pedido_id`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
