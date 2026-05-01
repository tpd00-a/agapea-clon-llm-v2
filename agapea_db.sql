-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 01-05-2026 a las 14:06:48
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `agapea_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `authors`
--

CREATE TABLE `authors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `bio` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `authors`
--

INSERT INTO `authors` (`id`, `name`, `bio`, `created_at`, `updated_at`) VALUES
(1, 'Gabriel García Márquez', 'Saepe laboriosam animi sed ipsam impedit ea. Ipsam possimus impedit neque. Magni ipsum reprehenderit sint alias vitae non. Et ad saepe rem blanditiis neque quia non.', '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(2, 'Isabel Allende', 'Voluptatem consectetur dolores qui perspiciatis quisquam ut consequatur. Esse quas asperiores mollitia et repudiandae. Tempore nobis quae quas.', '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(3, 'Carlos Ruiz Zafón', 'Quia accusantium molestias soluta eos eos voluptatem. Placeat quia id impedit similique modi eaque. Labore dignissimos saepe facilis in qui odit. Sit id quia expedita natus inventore ad.', '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(4, 'Mario Vargas Llosa', 'Praesentium in at id consectetur deleniti. Et dolor id voluptatem esse. Est sint incidunt sit facere. Corporis magni debitis animi voluptas.', '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(5, 'Cervantes', 'Blanditiis porro consequatur doloremque debitis. Alias quia qui deleniti voluptatem ex fuga. Ipsum blanditiis tempore error modi.', '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(6, 'J.K. Rowling', 'Vitae sed eos corporis sint. Et quo quaerat vel nulla dolores eum est quos. Quibusdam est ut dolorum fugit iste reprehenderit saepe. Saepe atque doloribus perspiciatis animi.', '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(7, 'Stephen King', 'Quaerat autem quia qui fugiat cum fugit voluptatibus. Aut in unde sed nulla explicabo quaerat porro beatae. Autem earum quis libero repellendus. Assumenda voluptatum quas placeat nihil veritatis voluptatem amet.', '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(8, 'George R.R. Martin', 'Vitae repellat enim ea vero dolores. Explicabo rerum totam cum sunt dolorum iste. Qui neque ex non aut.', '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(9, 'Agatha Christie', 'In provident et dolorem. Et suscipit maiores quas omnis. Deleniti hic labore doloribus veniam. Minima sunt officiis occaecati sed officia quia neque non.', '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(10, 'J.R.R. Tolkien', 'Placeat porro consequatur libero a. Tempora eius quam omnis saepe et. Necessitatibus dolorem fugit excepturi est sunt iste dolor. Voluptatibus vero eos temporibus placeat.', '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(11, 'Ken Follett', 'Molestias vitae amet quaerat sit qui omnis ut. Ut voluptatum incidunt molestias qui qui. Officiis aliquam minus laborum officia molestiae dolor. Consectetur qui et et et odio.', '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(12, 'Arturo Pérez-Reverte', 'Laudantium cupiditate aspernatur quis ipsum et unde. Eos explicabo doloribus sed modi. Dolores rerum et blanditiis rerum voluptatem.', '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(13, 'Laura Gallego', 'Eum cumque non quasi quia dolorum. Eaque nostrum voluptate molestiae et tempore. Est omnis doloremque ducimus quo voluptatum. Voluptatem eligendi dolorem molestias sit.', '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(14, 'Albert Espinosa', 'Eveniet in iusto velit fuga corrupti. Mollitia ut reprehenderit porro fugit placeat aliquid ex.', '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(15, 'Javier Castillo', 'Nihil praesentium illum deserunt voluptatem. Omnis repudiandae ad corrupti illum consequatur ut tempora illo. Dolorem et aperiam sed suscipit. Consectetur doloribus asperiores officia. Minus odio autem excepturi voluptatibus fuga aliquid eius iure.', '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(16, 'George Orwell', NULL, NULL, NULL),
(17, 'Oscar Wilde', NULL, NULL, NULL),
(18, 'Emily Brontë', NULL, NULL, NULL),
(19, 'Charlotte Brontë', NULL, NULL, NULL),
(20, 'F. Scott Fitzgerald', NULL, NULL, NULL),
(21, 'Jane Austen', NULL, NULL, NULL),
(22, 'Louisa May Alcott', NULL, NULL, NULL),
(23, 'Emilio Salgari', NULL, NULL, NULL),
(24, 'Julio Verne', NULL, NULL, NULL),
(25, 'Juan Gómez-Jurado', NULL, NULL, NULL),
(26, 'Dan Brown', NULL, NULL, NULL),
(27, 'David Lagercrantz', NULL, NULL, NULL),
(28, 'Stieg Larsson', NULL, NULL, NULL),
(29, 'J.K. Rowling', NULL, NULL, NULL),
(30, 'J.R.R. Tolkien', NULL, NULL, NULL),
(31, 'Stephenie Meyer', NULL, NULL, NULL),
(32, 'Suzanne Collins', NULL, NULL, NULL),
(33, 'Anna Frank', NULL, NULL, NULL),
(34, 'Nicolás Bautista', NULL, NULL, NULL),
(35, 'Stendhal', NULL, NULL, NULL),
(36, 'Víctor Hugo', NULL, NULL, NULL),
(37, 'Heidi Murkoff', NULL, NULL, NULL),
(38, 'Charles Duhigg', NULL, NULL, NULL),
(39, 'Yuval Noah Harari', NULL, NULL, NULL),
(40, 'Sun Tzu', NULL, NULL, NULL),
(41, 'John Berendt', NULL, NULL, NULL),
(42, 'Anthony Burgess', NULL, NULL, NULL),
(43, 'Isaac Asimov', NULL, NULL, NULL),
(44, 'Frank Herbert', NULL, NULL, NULL),
(45, 'William Gibson', NULL, NULL, NULL),
(46, 'Andy Weir', NULL, NULL, NULL),
(47, 'Emily St. John Mandel', NULL, NULL, NULL),
(48, 'Ursula K. Le Guin', NULL, NULL, NULL),
(49, 'Luis Alberto Spinetta', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `books`
--

CREATE TABLE `books` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `isbn` varchar(255) NOT NULL,
  `author_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `publisher_id` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `original_price` decimal(8,2) DEFAULT NULL,
  `discount` int(11) NOT NULL DEFAULT 0,
  `stock` int(11) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `cover_image` varchar(255) DEFAULT NULL,
  `pages` int(11) DEFAULT NULL,
  `language` varchar(255) NOT NULL DEFAULT 'Español',
  `year` int(11) DEFAULT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT 0,
  `is_bestseller` tinyint(1) NOT NULL DEFAULT 0,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `books`
--

INSERT INTO `books` (`id`, `title`, `isbn`, `author_id`, `category_id`, `publisher_id`, `price`, `original_price`, `discount`, `stock`, `description`, `cover_image`, `pages`, `language`, `year`, `genre`, `is_new`, `is_bestseller`, `is_featured`, `created_at`, `updated_at`) VALUES
(1, 'Don Quijote', 'ISBN-0001', 1, 1, 1, 24.36, NULL, 0, 0, NULL, 'agapea-clon-llm-v2/agapea-frontend/img/covers/1_don-quijote.jpg', NULL, 'Español', 1605, NULL, 0, 0, 0, NULL, NULL),
(2, 'Cien años de soledad', 'ISBN-0002', 2, 2, 1, 27.25, NULL, 0, 0, NULL, 'agapea-clon-llm-v2/agapea-frontend/img/covers/2_cien-a-os-de-soledad.jpg', NULL, 'Español', 1967, NULL, 0, 0, 0, NULL, NULL),
(3, 'El quijote', 'ISBN-0003', 1, 3, 1, 43.18, NULL, 0, 0, NULL, 'agapea-clon-llm-v2/agapea-frontend/img/covers/3_el-quijote.jpg', NULL, 'Español', 1605, NULL, 0, 0, 0, NULL, NULL),
(4, 'La casa de los espíritus', 'ISBN-0004', 3, 1, 1, 34.16, NULL, 0, 0, NULL, 'agapea-clon-llm-v2/agapea-frontend/img/covers/4_la-casa-de-los-esp-ritus.jpg', NULL, 'Español', 1982, NULL, 0, 0, 0, NULL, NULL),
(5, 'El laberinto de la soledad', 'ISBN-0005', 4, 4, 1, 21.24, NULL, 0, 0, NULL, 'agapea-clon-llm-v2/agapea-frontend/img/covers/5_el-laberinto-de-la-soledad.jpg', NULL, 'Español', 1950, NULL, 0, 0, 0, NULL, NULL),
(6, 'Rayuela', 'ISBN-0006', 5, 5, 1, 63.73, NULL, 0, 0, NULL, 'agapea-clon-llm-v2/agapea-frontend/img/covers/6_rayuela.jpg', NULL, 'Español', 1963, NULL, 0, 0, 0, NULL, NULL),
(7, 'Ficciones', 'ISBN-0007', 6, 6, 1, 74.93, NULL, 0, 0, NULL, 'agapea-clon-llm-v2/agapea-frontend/img/covers/7_ficciones.jpg', NULL, 'Español', 1944, NULL, 0, 0, 0, NULL, NULL),
(8, 'El amor en los tiempos del cólera', 'ISBN-0008', 2, 7, 1, 83.47, NULL, 0, 0, NULL, 'agapea-clon-llm-v2/agapea-frontend/img/covers/8_el-amor-en-los-tiempos-del-c-lera.jpg', NULL, 'Español', 1985, NULL, 0, 0, 0, NULL, NULL),
(9, 'La sombra del viento', 'ISBN-0009', 7, 8, 1, 92.55, NULL, 0, 0, NULL, 'agapea-clon-llm-v2/agapea-frontend/img/covers/9_la-sombra-del-viento.jpg', NULL, 'Español', 2001, NULL, 0, 0, 0, NULL, NULL),
(10, 'Berserk', 'ISBN-0010', 8, 9, 1, 32.35, NULL, 0, 0, NULL, 'agapea-clon-llm-v2/agapea-frontend/img/covers/10_berserk.jpg', NULL, 'Español', 1990, NULL, 0, 0, 0, NULL, NULL),
(11, 'Crónica de una muerte anunciada', 'ISBN-0011', 2, 1, 1, 24.10, NULL, 0, 0, NULL, 'agapea-clon-llm-v2/agapea-frontend/img/covers/11_cr-nica-de-una-muerte-anuncia.jpg', NULL, 'Español', 1981, NULL, 0, 0, 0, NULL, NULL),
(12, 'La Celestina', 'ISBN-0012', 9, 10, 1, 83.44, NULL, 0, 0, NULL, 'agapea-clon-llm-v2/agapea-frontend/img/covers/12_la-celestina.jpg', NULL, 'Español', 1499, NULL, 0, 0, 0, NULL, NULL),
(13, 'El conde de Montecristo', 'ISBN-0013', 10, 3, 1, 84.89, NULL, 0, 0, NULL, 'agapea-clon-llm-v2/agapea-frontend/img/covers/13_el-conde-de-montecristo.jpg', NULL, 'Español', 1844, NULL, 0, 0, 0, NULL, NULL),
(14, 'El Príncipe', 'ISBN-0014', 11, 11, 1, 74.14, NULL, 0, 0, NULL, 'agapea-clon-llm-v2/agapea-frontend/img/covers/14_el-pr-ncipe.jpg', NULL, 'Español', 1532, NULL, 0, 0, 0, NULL, NULL),
(15, 'La revolución de los ricos', 'ISBN-0015', 12, 11, 1, 96.04, NULL, 0, 0, NULL, 'agapea-clon-llm-v2/agapea-frontend/img/covers/15_la-evolucion-de-los-ricos.png', NULL, 'Español', 2003, NULL, 0, 0, 0, NULL, NULL),
(16, 'Pedro Páramo', 'ISBN-0016', 13, 1, 1, 77.78, NULL, 0, 0, NULL, 'agapea-clon-llm-v2/agapea-frontend/img/covers/16_pedro-paramo.png', NULL, 'Español', 1955, NULL, 0, 0, 0, NULL, NULL),
(17, 'Como agua para chocolate', 'ISBN-0017', 14, 7, 1, 80.75, NULL, 0, 0, NULL, 'agapea-clon-llm-v2/agapea-frontend/img/covers/17_como-agua-para-chocolate.jpg', NULL, 'Español', 1989, NULL, 0, 0, 0, NULL, NULL),
(18, 'El Aleph', 'ISBN-0018', 6, 6, 1, 70.44, NULL, 0, 0, NULL, 'agapea-clon-llm-v2/agapea-frontend/img/covers/18_el-aleph.jpg', NULL, 'Español', 1949, NULL, 0, 0, 0, NULL, NULL),
(19, 'La tregua', 'ISBN-0019', 15, 1, 1, 89.96, NULL, 0, 0, NULL, 'agapea-clon-llm-v2/agapea-frontend/img/covers/19_la-tregua.jpg', NULL, 'Español', 1960, NULL, 0, 0, 0, NULL, NULL),
(20, '1984', 'ISBN-0020', 16, 12, 1, 58.46, NULL, 0, 0, NULL, 'agapea-clon-llm-v2/agapea-frontend/img/covers/20_mil-novecientos-ochenta-y-cuatro.jpg', NULL, 'Español', 1949, NULL, 0, 0, 0, NULL, NULL),
(21, 'El retrato de Dorian Gray', 'ISBN-0021', 17, 13, 1, 82.42, NULL, 0, 0, NULL, 'agapea-clon-llm-v2/agapea-frontend/img/covers/21_el-retrato-de-dorian-gray.jpg', NULL, 'Español', 1890, NULL, 0, 0, 0, NULL, NULL),
(23, 'Jane Eyre', 'ISBN-0023', 19, 7, 1, 56.74, NULL, 0, 0, NULL, 'agapea-clon-llm-v2/agapea-frontend/img/covers/23_jane-eyre.jpg', NULL, 'Español', 1847, NULL, 0, 0, 0, NULL, NULL),
(24, 'El gran Gatsby', 'ISBN-0024', 20, 1, 1, 96.42, NULL, 0, 0, NULL, 'agapea-clon-llm-v2/agapea-frontend/img/covers/24_el-gran-gatsby.jpg', NULL, 'Español', 1925, NULL, 0, 0, 0, NULL, NULL),
(25, 'Orgullo y prejuicio', 'ISBN-0025', 21, 7, 1, 51.90, NULL, 0, 0, NULL, 'agapea-clon-llm-v2/agapea-frontend/img/covers/25_orgullo-y-prejuicio.jpg', NULL, 'Español', 1813, NULL, 0, 0, 0, NULL, NULL),
(28, 'El corsario negro', 'ISBN-0028', 23, 3, 1, 30.24, NULL, 0, 0, NULL, 'agapea-clon-llm-v2/agapea-frontend/img/covers/28_el-corsario-negro.jpg', NULL, 'Español', 1898, NULL, 0, 0, 0, NULL, NULL),
(29, 'La isla misteriosa', 'ISBN-0029', 24, 14, 1, 55.50, NULL, 0, 0, NULL, 'agapea-clon-llm-v2/agapea-frontend/img/covers/29_la-isla-misteriosa.jpg', NULL, 'Español', 1874, NULL, 0, 0, 0, NULL, NULL),
(30, 'Viaje al centro de la tierra', 'ISBN-0030', 24, 14, 1, 86.79, NULL, 0, 0, NULL, 'agapea-clon-llm-v2/agapea-frontend/img/covers/30_viaje-al-centro-de-la-tierra.jpg', NULL, 'Español', 1864, NULL, 0, 0, 0, NULL, NULL),
(31, 'Veinte mil leguas de viaje submarino', 'ISBN-0031', 24, 14, 1, 87.44, NULL, 0, 0, NULL, 'agapea-clon-llm-v2/agapea-frontend/img/covers/31_veinte-mil-leguas-de-viaje-submarino.jpg', NULL, 'Español', 1870, NULL, 0, 0, 0, NULL, NULL),
(36, 'Millenium', 'ISBN-0036', 28, 15, 1, 76.83, NULL, 0, 0, NULL, 'agapea-clon-llm-v2/agapea-frontend/img/covers/36_millenium.jpg', NULL, 'Español', 2005, NULL, 0, 0, 0, NULL, NULL),
(39, 'El Señor de los Anillos', 'ISBN-0039', 30, 17, 1, 21.84, NULL, 0, 0, NULL, 'agapea-clon-llm-v2/agapea-frontend/img/covers/39_el-se-or-de-los-anillos.jpg', NULL, 'Español', 1954, NULL, 0, 0, 0, NULL, NULL),
(40, 'Crepúsculo', 'ISBN-0040', 31, 7, 1, 98.69, NULL, 0, 0, NULL, 'agapea-clon-llm-v2/agapea-frontend/img/covers/40_crep-sculo.jpg', NULL, 'Español', 2005, NULL, 0, 0, 0, NULL, NULL),
(44, 'Rojo y Negro', 'ISBN-0044', 35, 1, 1, 87.95, NULL, 0, 0, NULL, 'agapea-clon-llm-v2/agapea-frontend/img/covers/44_rojo-y-negro.jpg', NULL, 'Español', 1830, NULL, 0, 0, 0, NULL, NULL),
(46, 'Qué esperar cuando esperas', 'ISBN-0046', 37, 20, 1, 43.66, NULL, 0, 0, NULL, 'agapea-clon-llm-v2/agapea-frontend/img/covers/46_qu-esperar-cuando-esperas.jpg', NULL, 'Español', 1989, NULL, 0, 0, 0, NULL, NULL),
(48, 'Sapiens', 'ISBN-0048', 39, 21, 1, 94.47, NULL, 0, 0, NULL, 'agapea-clon-llm-v2/agapea-frontend/img/covers/48_sapiens.jpg', NULL, 'Español', 2011, NULL, 0, 0, 0, NULL, NULL),
(49, 'El arte de la guerra', 'ISBN-0049', 40, 22, 1, 81.35, NULL, 0, 0, NULL, 'agapea-clon-llm-v2/agapea-frontend/img/covers/49_el-arte-de-la-guerra.jpg', NULL, 'Español', 500, NULL, 0, 0, 0, NULL, NULL),
(51, 'La naranja mecánica', 'ISBN-0051', 42, 12, 1, 23.34, NULL, 0, 0, NULL, 'agapea-clon-llm-v2/agapea-frontend/img/covers/51_la-naranja-mec-nica.jpg', NULL, 'Español', 1962, NULL, 0, 0, 0, NULL, NULL),
(52, 'Fundación', 'ISBN-0052', 43, 14, 1, 92.66, NULL, 0, 0, NULL, 'agapea-clon-llm-v2/agapea-frontend/img/covers/52_fundaci-n.jpg', NULL, 'Español', 1951, NULL, 0, 0, 0, NULL, NULL),
(54, 'El fin de la eternidad', 'ISBN-0054', 43, 14, 1, 53.27, NULL, 0, 0, NULL, 'agapea-clon-llm-v2/agapea-frontend/img/covers/54_el-fin-de-la-eternidad.jpg', NULL, 'Español', 1955, NULL, 0, 0, 0, NULL, NULL),
(55, 'Dune', 'ISBN-0055', 44, 14, 1, 48.36, NULL, 0, 0, NULL, 'agapea-clon-llm-v2/agapea-frontend/img/covers/55_dune.jpg', NULL, 'Español', 1965, NULL, 0, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `book_tag`
--

CREATE TABLE `book_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Literatura', 'literatura', '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(2, 'Ciencias Humanas', 'ciencias-humanas', '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(3, 'Ciencias Técnicas', 'ciencias-tecnicas', '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(4, 'Libros Infantiles', 'libros-infantiles', '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(5, 'Tiempo Libre', 'tiempo-libre', '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(6, 'Cuento', '', NULL, NULL),
(7, 'Novela romántica', 'novela-romantica', NULL, NULL),
(8, 'Novela de misterio', 'novela-misterio', NULL, NULL),
(9, 'Manga', 'manga', NULL, NULL),
(10, 'Tragicomedia', 'tragicomedia', NULL, NULL),
(11, 'Política', 'politica', NULL, NULL),
(12, 'Distopía', 'distopia', NULL, NULL),
(13, 'Novela gótica', 'novela-gotica', NULL, NULL),
(14, 'Ciencia ficción', 'ciencia-ficcion', NULL, NULL),
(15, 'Thriller', 'thriller', NULL, NULL),
(16, 'Fantasía', 'fantasia', NULL, NULL),
(17, 'Fantasía épica', 'fantasia-epica', NULL, NULL),
(18, 'Biografía', 'biografia', NULL, NULL),
(19, 'Drama', 'drama', NULL, NULL),
(20, 'Autoayuda', 'autoayuda', NULL, NULL),
(21, 'Historia', 'historia', NULL, NULL),
(22, 'Estrategia', 'estrategia', NULL, NULL),
(23, 'Poesía', 'poesia', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `name`, `email`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(1, 'tomas pp', 'tomas@email.com', 'Pedido', 'Cuando sale mi pedido', '2026-04-14 13:10:19', '2026-04-14 13:10:19'),
(2, 'el66 jajaa', '66@gmail.com', 'Pedido', 'wewewewewewewew', '2026-05-01 09:07:15', '2026-05-01 09:07:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `discount_pct` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `expires_at` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `discount_pct`, `is_active`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'AGAPEA10', 10, 1, '2026-10-13', '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(2, 'LIBROS5', 5, 1, '2026-07-13', '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(3, 'VERANO20', 20, 1, '2026-05-13', '2026-04-13 12:16:01', '2026-04-13 12:16:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nif` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `newsletter` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cart_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`cart_data`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `customers`
--

INSERT INTO `customers` (`id`, `nif`, `first_name`, `last_name`, `email`, `password`, `phone`, `address`, `birth_date`, `newsletter`, `created_at`, `updated_at`, `cart_data`) VALUES
(1, 'NIF3309', 'tomas', 'pp', 'tomas@email.com', '$2y$12$mxR5yPqBUy0dAbS/qk9tN.5rx16S0HmmDRNJbNSXH17BJf2wdziWi', NULL, NULL, NULL, 0, '2026-04-14 11:43:36', '2026-04-14 13:10:40', '[]'),
(2, 'NIF6170', 'pepe', 'pp', 'pepe@email.com', '$2y$12$PtqJGSOoZvVYHjQ9Dn8OzunHS9Tx/iFGwZhcSRU6wxkOz0TXDRkK.', NULL, NULL, NULL, 0, '2026-04-14 14:07:49', '2026-04-14 16:15:20', '[]'),
(3, 'NIF2785', 'toto', 'werw', 'tu@email.com', '$2y$12$njSa/jUyZYJ5rN23IHaJe.u64uwUNsBYJLOJlOBbx1Pz/ugIFfAZe', NULL, NULL, NULL, 0, '2026-04-14 16:17:19', '2026-04-14 16:17:19', NULL),
(4, 'NIF4846', 'el66', 'jajaa', '66@gmail.com', '$2y$12$/6yF2kJW7i3Of7r0Sh3acOzaTvbXty7XOdn7Go1lh1nD56OjFXZz2', NULL, NULL, NULL, 0, '2026-05-01 09:05:03', '2026-05-01 09:05:37', '[]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favorites`
--

CREATE TABLE `favorites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0000_01_01_000000_create_roles_table', 1),
(2, '0001_01_01_000000_create_users_table', 1),
(3, '0001_01_01_000001_create_cache_table', 1),
(4, '0001_01_01_000002_create_jobs_table', 1),
(5, '2026_04_13_135652_create_personal_access_tokens_table', 1),
(6, '2026_04_13_140208_create_categories_table', 1),
(7, '2026_04_13_140209_create_authors_table', 1),
(8, '2026_04_13_140209_create_publishers_table', 1),
(9, '2026_04_13_140210_create_books_table', 1),
(10, '2026_04_13_140210_create_tags_table', 1),
(11, '2026_04_13_140211_create_customers_table', 1),
(12, '2026_04_13_140211_create_orders_table', 1),
(13, '2026_04_13_140212_create_favorites_table', 1),
(14, '2026_04_13_140212_create_order_items_table', 1),
(15, '2026_04_13_140212_create_reviews_table', 1),
(16, '2026_04_13_140213_create_coupons_table', 1),
(17, '2026_04_13_140300_create_book_tag_table', 1),
(19, '2026_04_14_105141_add_cart_data_to_customers_table', 2),
(21, '2026_04_14_135033_create_contact_messages_table', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `subtotal` decimal(10,2) NOT NULL,
  `shipping_cost` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `total` decimal(10,2) NOT NULL,
  `coupon_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `status`, `subtotal`, `shipping_cost`, `discount_amount`, `total`, `coupon_code`, `created_at`, `updated_at`) VALUES
(1, 1, 'processing', 112.92, 0.00, 0.00, 112.92, NULL, '2026-04-14 11:43:49', '2026-04-14 13:12:15'),
(2, 1, 'delivered', 104.93, 0.00, 0.00, 104.93, NULL, '2026-04-14 13:10:37', '2026-04-14 15:33:58'),
(3, 2, 'pending', 64.57, 0.00, 0.00, 64.57, NULL, '2026-04-14 15:32:47', '2026-04-14 15:32:47'),
(4, 2, 'pending', 37.13, 0.00, 0.00, 37.13, NULL, '2026-04-14 16:15:16', '2026-04-14 16:15:16'),
(5, 4, 'pending', 50.00, 0.00, 0.00, 50.00, NULL, '2026-05-01 09:05:30', '2026-05-01 09:05:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `unit_price` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'admin-token', '64a4e03527fefadbd3c20dc65730d8601306de5d85fe26297b444373b48cbb14', '[\"*\"]', '2026-04-14 11:39:30', NULL, '2026-04-14 11:38:52', '2026-04-14 11:39:30'),
(2, 'App\\Models\\Customer', 1, 'customer-token', '82ca92340db1d31b1ca75877a95fd21e613629c275d2d244c35d727537ff2cad', '[\"*\"]', '2026-04-14 11:43:52', NULL, '2026-04-14 11:43:36', '2026-04-14 11:43:52'),
(3, 'App\\Models\\User', 1, 'admin-token', 'ee21ef6a56eb6c2e4bbd0ad8da58a9ab4234d47680718811291500923d75482e', '[\"*\"]', '2026-04-14 13:14:12', NULL, '2026-04-14 11:44:57', '2026-04-14 13:14:12'),
(4, 'App\\Models\\Customer', 1, 'customer-token', '01634831fa4cad8376665be86ed76a7225cb6e20ac69789da1de2bc003540791', '[\"*\"]', '2026-04-14 13:10:40', NULL, '2026-04-14 13:09:28', '2026-04-14 13:10:40'),
(5, 'App\\Models\\User', 1, 'admin-token', '1bfb61797c55d25d7bfcad496f4bdc879c91dcae1d51b414dc858ceb1edf3e18', '[\"*\"]', '2026-04-14 14:02:24', NULL, '2026-04-14 13:56:52', '2026-04-14 14:02:24'),
(6, 'App\\Models\\Customer', 2, 'customer-token', '773c5bd7afc6040966074a9a12ef071318514478d78d671960bdbe286492004a', '[\"*\"]', NULL, NULL, '2026-04-14 14:07:50', '2026-04-14 14:07:50'),
(7, 'App\\Models\\User', 1, 'admin-token', 'd2dda027741b7691b3197bf955ed9d09fb23c4d13ae44866feb1ab396aa9527f', '[\"*\"]', '2026-04-14 15:34:47', NULL, '2026-04-14 14:17:49', '2026-04-14 15:34:47'),
(8, 'App\\Models\\Customer', 2, 'customer-token', '4c66b8346e8d24dc7096415f16f5dc7e51fbb42f3f5dc9c37bff797278788e35', '[\"*\"]', '2026-04-14 15:32:51', NULL, '2026-04-14 14:20:13', '2026-04-14 15:32:51'),
(9, 'App\\Models\\Customer', 2, 'customer-token', 'bdd84909b707927b936b4b935c9a67e230bdd1d6b2d8125ec43af6f5fe1cb510', '[\"*\"]', '2026-04-14 16:15:20', NULL, '2026-04-14 15:41:24', '2026-04-14 16:15:20'),
(10, 'App\\Models\\Customer', 3, 'customer-token', '3a36d8af0287f6000f5d62c1bd59e539d3ee9e7b69e99eec422d7f6d84fda5f5', '[\"*\"]', NULL, NULL, '2026-04-14 16:17:19', '2026-04-14 16:17:19'),
(11, 'App\\Models\\User', 1, 'admin-token', '781c2ac20424b5b7723e050a2df88481dbfa48de7f8ca6bad2d84bcb3282ea09', '[\"*\"]', '2026-04-14 16:21:01', NULL, '2026-04-14 16:19:00', '2026-04-14 16:21:01'),
(12, 'App\\Models\\User', 1, 'admin-token', '99028427a7982b0573c61ae2eb45d25fe8774a3f8eb1f0bbd9ffc3c4b2dcdb5e', '[\"*\"]', '2026-05-01 09:06:13', NULL, '2026-05-01 08:44:32', '2026-05-01 09:06:13'),
(13, 'App\\Models\\Customer', 4, 'customer-token', 'c3bd279221906de27922f063e573d8c0fcaa00f870ef700bbce43852349d269b', '[\"*\"]', '2026-05-01 09:05:37', NULL, '2026-05-01 09:05:03', '2026-05-01 09:05:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publishers`
--

CREATE TABLE `publishers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `publishers`
--

INSERT INTO `publishers` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Planeta', '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(2, 'Salamandra', '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(3, 'Debolsillo', '2026-04-13 12:16:01', '2026-04-13 12:16:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2026-04-13 12:16:00', '2026-04-13 12:16:00'),
(2, 'editor', '2026-04-13 12:16:00', '2026-04-13 12:16:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tags`
--

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Ficción', '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(2, 'Misterio', '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(3, 'Historia', '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(4, 'Fantasía', '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(5, 'Novela Negra', '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(6, 'Poesía', '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(7, 'Romance', '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(8, 'Desarrollo Personal', '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(9, 'Cocina', '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(10, 'Arte', '2026-04-13 12:16:01', '2026-04-13 12:16:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrador Agapea', 'admin@agapea.com', NULL, '$2y$12$TIy2uwLRen..Jxykj3Ture01KkhPqYGz5t3IPL8ejPc2NwNt7sYha', 1, NULL, '2026-04-13 12:16:01', '2026-04-13 12:16:01');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `books_isbn_unique` (`isbn`),
  ADD KEY `books_author_id_foreign` (`author_id`),
  ADD KEY `books_category_id_foreign` (`category_id`),
  ADD KEY `books_publisher_id_foreign` (`publisher_id`);

--
-- Indices de la tabla `book_tag`
--
ALTER TABLE `book_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_tag_book_id_foreign` (`book_id`),
  ADD KEY `book_tag_tag_id_foreign` (`tag_id`);

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indices de la tabla `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indices de la tabla `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_nif_unique` (`nif`),
  ADD UNIQUE KEY `customers_email_unique` (`email`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favorites_customer_id_foreign` (`customer_id`),
  ADD KEY `favorites_book_id_foreign` (`book_id`);

--
-- Indices de la tabla `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indices de la tabla `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_customer_id_foreign` (`customer_id`);

--
-- Indices de la tabla `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_book_id_foreign` (`book_id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indices de la tabla `publishers`
--
ALTER TABLE `publishers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_customer_id_foreign` (`customer_id`),
  ADD KEY `reviews_book_id_foreign` (`book_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_name_unique` (`name`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `authors`
--
ALTER TABLE `authors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de la tabla `book_tag`
--
ALTER TABLE `book_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `publishers`
--
ALTER TABLE `publishers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `books_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `books_publisher_id_foreign` FOREIGN KEY (`publisher_id`) REFERENCES `publishers` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `book_tag`
--
ALTER TABLE `book_tag`
  ADD CONSTRAINT `book_tag_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorites_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
