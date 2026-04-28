-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-04-2026 a las 12:30:48
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
(15, 'Javier Castillo', 'Nihil praesentium illum deserunt voluptatem. Omnis repudiandae ad corrupti illum consequatur ut tempora illo. Dolorem et aperiam sed suscipit. Consectetur doloribus asperiores officia. Minus odio autem excepturi voluptatibus fuga aliquid eius iure.', '2026-04-13 12:16:01', '2026-04-13 12:16:01');

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
(1, 'Maxime enim cumque veniam.', '9789397009360', 14, 5, 1, 30.58, 38.23, 20, 63, 'Asperiores distinctio voluptatem quia quae. Iure sit enim sit vitae ullam. Voluptatem nam in possimus quisquam porro non et.\n\nEos aliquid libero et unde ea qui. Earum dolores maiores nihil distinctio ducimus fugiat. Ducimus accusantium molestias atque ducimus.\n\nLabore praesentium consequatur libero ea voluptatem. Consequatur quod eum sit aut. Nihil aut eum exercitationem omnis commodi sed impedit. Enim voluptate est eveniet ipsum ut.', 'https://via.placeholder.com/300x450.png?text=Libro+1', 853, 'Español', 2002, 'Misterio', 0, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(2, 'Voluptatem sint eveniet.', '9791144070509', 14, 1, 1, 27.61, NULL, 0, 49, 'Perspiciatis perferendis ducimus et sed soluta soluta. Dignissimos eos dolorem aut et alias quasi. Nulla ullam et consequatur dolore nisi eum quia.\n\nIpsam rem error voluptas et velit quisquam. Earum enim sint reiciendis ut neque. Eveniet sunt vel blanditiis tenetur minus.\n\nEt amet impedit labore laudantium corporis. Accusamus vitae nihil porro rerum. Molestiae quod magni explicabo quia voluptatem vero. Incidunt amet tenetur nemo dolore optio qui.', 'https://via.placeholder.com/300x450.png?text=Libro+2', 218, 'Inglés', 1973, 'Fantasía', 1, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(3, 'Omnis sit reiciendis.', '9782818340585', 7, 5, 1, 21.80, 23.96, 9, 126, 'Est quibusdam voluptatibus quidem. Ea rerum perferendis temporibus. Dolores qui reiciendis fugit. Est voluptatem et maxime et et vero atque.\n\nAutem sed ea dolore placeat est. Eum illum soluta alias aut assumenda. Eaque voluptas aut veritatis porro dolore omnis.\n\nPraesentium cupiditate sapiente inventore ut ut. Eos quam occaecati aliquid adipisci. Quisquam rerum tempora et qui ex natus eum. Vel nisi assumenda dolorum fuga.', 'https://via.placeholder.com/300x450.png?text=Libro+3', 345, 'Inglés', 2014, 'Novela Negra', 0, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(4, 'Doloribus quo sapiente voluptates aliquam.', '9793353898370', 9, 3, 1, 35.03, NULL, 0, 57, 'Vero quia est facilis et qui ut. Est consequatur nulla aspernatur odio autem numquam. Facilis sit voluptas sunt inventore non.\n\nEst vitae et vel id. Est omnis sed ea consequuntur officiis. Similique in animi sequi voluptate porro nihil. Dolore et voluptatibus eum velit dolorem.\n\nEt debitis modi sequi ut ut. Quia rerum magnam aut explicabo eum.', 'https://via.placeholder.com/300x450.png?text=Libro+4', 891, 'Catalán', 1976, 'Fantasía', 0, 0, 1, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(5, 'Nisi consequatur harum non sed.', '9788808586193', 12, 3, 2, 20.85, NULL, 0, 121, 'Harum explicabo officia in iure. Mollitia dolores provident possimus natus odit. Tempore debitis quae provident ut facere quo.\n\nDoloremque autem dignissimos qui omnis earum. Qui necessitatibus rerum doloremque autem dicta vitae et. Assumenda perspiciatis veniam in perspiciatis vitae impedit. Nisi ea dolor quaerat enim nemo magnam ut debitis.\n\nModi recusandae mollitia optio doloribus tempora ut molestiae doloremque. Fugit nobis aut sed dolore omnis aliquam at molestias. Temporibus nam provident voluptate delectus et distinctio. Aliquid est aut animi similique sed.', 'https://via.placeholder.com/300x450.png?text=Libro+5', 406, 'Español', 2015, 'Ficción', 0, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(6, 'Quo ut omnis aut harum.', '9781494611996', 5, 3, 2, 44.95, 52.88, 15, 146, 'Repudiandae laboriosam quasi pariatur est delectus deserunt. Maiores voluptatem est tempore quis. Id in perferendis vel temporibus voluptates omnis. Amet autem porro in modi nobis sed.\n\nEos excepturi temporibus quo sed pariatur et eaque. Incidunt sed officiis quia consequatur vel et dolores. Non ea ratione omnis quo. Soluta quia repellat dolor ab.\n\nEst nobis voluptas dolor aut ab qui hic consequatur. Consequuntur omnis cum est ut magni atque et. Qui cupiditate aut qui voluptas dolores iure.', 'https://via.placeholder.com/300x450.png?text=Libro+6', 903, 'Inglés', 2010, 'Novela Negra', 0, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(7, 'Magni et sapiente.', '9798934018741', 3, 4, 2, 39.95, NULL, 0, 82, 'Soluta aut maiores minima est eius dicta sunt deserunt. Fuga culpa eos eum veniam sit similique. Distinctio minus quidem molestiae iste molestias aut cupiditate.\n\nQuia quaerat qui cumque perferendis vero. Omnis dolor similique voluptatum rerum. Sed error non at praesentium.\n\nMaxime quod qui voluptatem voluptatem. Vero eum voluptates suscipit. Pariatur ratione eligendi qui laudantium.', 'https://via.placeholder.com/300x450.png?text=Libro+7', 521, 'Español', 2009, 'Poesía', 0, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(8, 'Iure enim velit.', '9780474634215', 3, 1, 2, 27.86, NULL, 0, 28, 'Provident vel sapiente quasi est est minima aliquid. Incidunt aut dolorum voluptates ipsum omnis. Sunt architecto et nam hic et sit et. Non sint exercitationem nesciunt praesentium neque voluptatum nulla.\n\nId dolores dolore autem est. Eius aspernatur aspernatur explicabo consequatur laudantium accusamus qui nihil.\n\nEos qui officia et delectus aut ratione. Nostrum saepe modi incidunt ipsum et non. Debitis vel ipsam velit dolores nisi quasi rerum. Alias repudiandae et ea delectus sapiente corporis natus.', 'https://via.placeholder.com/300x450.png?text=Libro+8', 814, 'Español', 1980, 'Cocina', 0, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(9, 'Aut quia repellendus.', '9784455871354', 4, 2, 3, 28.60, NULL, 0, 55, 'Nemo soluta officia fugit. Esse occaecati nesciunt dolore saepe aut est consectetur. Explicabo quisquam porro omnis quos atque ipsam quos. Voluptates sequi quam nihil et.\n\nSit optio facilis fuga beatae eaque porro quae iste. Aut dolores modi eveniet ex voluptas. Fugit voluptatem dolor numquam nostrum. Dolor inventore consequuntur ipsum adipisci.\n\nQuos suscipit voluptatibus numquam ex tenetur inventore. Minima excepturi est culpa est. Inventore sequi quos facere rerum id dicta provident. Maxime alias veritatis omnis blanditiis cupiditate. Voluptatem consectetur autem neque doloremque maxime quo.', 'https://via.placeholder.com/300x450.png?text=Libro+9', 831, 'Catalán', 1988, 'Novela Negra', 1, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(10, 'Vitae totam nesciunt et earum nobis.', '9780339273597', 12, 4, 2, 12.76, NULL, 0, 39, 'Voluptates veniam corporis est dicta qui nesciunt aliquid. Temporibus accusantium repellat corrupti unde rem nihil. Quia quo quis in sunt labore quisquam iusto velit.\n\nDeserunt eos similique eaque voluptatem laudantium. Quae amet reiciendis explicabo nulla.\n\nLaborum excepturi enim quae natus et sit excepturi voluptatem. Quia quo rerum sunt accusantium facilis enim qui. Est omnis quia illum sint. Eius est nulla eos temporibus.', 'https://via.placeholder.com/300x450.png?text=Libro+10', 572, 'Español', 1980, 'Historia', 0, 1, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(11, 'Et ut.', '9790206526183', 13, 2, 2, 41.80, 45.43, 8, 94, 'Ut veniam et sit. Nisi voluptates ut error non. Libero fuga ut et eos ullam est. Ex cumque dolores sed.\n\nRepellat delectus quos nobis sit. Adipisci quis voluptas earum voluptatem non unde commodi.\n\nVelit aut temporibus est repellat suscipit. Et ratione ut alias dolor. Minus magni et et et in libero. Occaecati itaque facilis eos quasi odio.', 'https://via.placeholder.com/300x450.png?text=Libro+11', 747, 'Inglés', 1972, 'Historia', 0, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(12, 'Accusantium ut tempora.', '9796078184827', 1, 4, 1, 32.19, NULL, 0, 106, 'Quisquam commodi natus iusto veniam sunt ut suscipit quidem. Non qui consequuntur beatae et. Illo perferendis tempore ducimus.\n\nAspernatur sed aspernatur tempora quisquam. Eius deleniti eos quisquam quos quos saepe occaecati. Tempore eum nesciunt eaque et dolor.\n\nQuo qui in amet voluptatem. Et omnis ea est et. Placeat sit ducimus veniam eos ut placeat dolorum quibusdam.', 'https://via.placeholder.com/300x450.png?text=Libro+12', 769, 'Español', 1982, 'Ficción', 0, 0, 1, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(13, 'Odit atque aspernatur et.', '9780732390099', 4, 1, 3, 32.90, 40.62, 19, 147, 'Nihil ab optio accusamus minima. Voluptas esse qui eligendi repudiandae saepe laborum. Rerum voluptatem adipisci id harum voluptates.\n\nQuas hic voluptates aut ratione quis accusantium. Omnis consequatur minus eligendi ducimus. Architecto itaque quasi neque enim magnam perferendis.\n\nEos sit ut nulla. Culpa ullam laboriosam vitae fugiat. Earum fuga qui id ea quae quaerat atque. Hic eos animi autem saepe.', 'https://via.placeholder.com/300x450.png?text=Libro+13', 407, 'Español', 1984, 'Cocina', 0, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(14, 'Quia placeat aut rerum aut sint molestiae explicabo.', '9795211067614', 14, 2, 1, 9.68, 10.41, 7, 148, 'Ut odit delectus ut nulla maxime similique vel. Omnis deleniti nulla repudiandae omnis quis autem praesentium. Nam quibusdam molestias non non officia temporibus.\n\nFuga voluptatem rerum reprehenderit quia. Natus voluptatum voluptates explicabo enim. Dolor iure necessitatibus consequatur est cum velit ducimus. Debitis quo illum nesciunt quia aut ipsa dolores.\n\nIste cumque deleniti molestiae temporibus officia. Molestiae placeat quo consequuntur nemo possimus dolore qui nostrum. Voluptas minus aperiam voluptas ullam fugit repudiandae repudiandae. Aspernatur saepe sit numquam quam quod. Excepturi dignissimos voluptatem quo quae.', 'https://via.placeholder.com/300x450.png?text=Libro+14', 688, 'Español', 1986, 'Romance', 0, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(15, 'Consequatur labore aut doloremque odit.', '9785004451911', 4, 4, 2, 13.36, NULL, 0, 56, 'Quibusdam id sit quia officia quidem. Aspernatur unde voluptatem aperiam veritatis alias. Commodi quos voluptas repellendus et. Dolores et mollitia aliquam quas.\n\nPariatur pariatur aut error qui. Deserunt sit id veniam rerum quo dolorum. Aperiam sed quis et excepturi quo optio quas. Est sit unde asperiores.\n\nSint excepturi nesciunt vel mollitia tempora nemo consequatur. Rerum recusandae et sed nobis consectetur.', 'https://via.placeholder.com/300x450.png?text=Libro+15', 711, 'Catalán', 1976, 'Poesía', 1, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(16, 'Consequuntur dolorem sit iusto.', '9781210593193', 2, 5, 1, 43.41, NULL, 0, 55, 'Autem voluptatem voluptas quae sit quia similique. Suscipit veritatis voluptas aliquam quod voluptates eum. Numquam esse ab nobis nemo neque sed.\n\nNam facere reprehenderit officiis veniam nemo. Illum consequuntur at iste. Tempore eum quibusdam aliquid qui quis praesentium accusamus. Consequuntur ut labore est qui.\n\nNobis beatae ut ea aliquid laborum quis labore. Adipisci qui eligendi consequatur dolorem est soluta molestiae. Officia omnis nobis qui rerum non soluta non.', 'https://via.placeholder.com/300x450.png?text=Libro+16', 683, 'Español', 2007, 'Desarrollo Personal', 1, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(17, 'Qui sed veritatis sit.', '9792692612616', 9, 3, 3, 28.57, NULL, 0, 136, 'Dignissimos nobis assumenda maiores eos magni est. Voluptatum voluptatum quisquam consequatur itaque et est et. Voluptatem nostrum aut velit blanditiis ut sint veritatis. Dolorem molestias illum vitae magnam ipsa eaque.\n\nAut accusamus dolores vel non culpa. Itaque delectus dolore aut consequatur aut. Perspiciatis maxime in enim sed explicabo rem.\n\nEos dolorum maxime est accusamus occaecati. Dolorum officia fuga ea autem voluptate architecto quaerat. Doloremque necessitatibus aut deserunt non odio excepturi minus delectus.', 'https://via.placeholder.com/300x450.png?text=Libro+17', 357, 'Español', 2012, 'Poesía', 0, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(18, 'Repudiandae architecto commodi minima.', '9786101168115', 2, 4, 1, 31.91, 39.89, 20, 107, 'Reprehenderit culpa iure deleniti dolore. Hic eum excepturi quia quo facilis iure similique. Iusto nihil quisquam distinctio voluptate. Vero repudiandae deserunt et unde possimus natus.\n\nTotam laboriosam quo dolorem aut explicabo quia consequatur non. Est in dolores illo fugit ullam. Aut blanditiis consectetur suscipit nisi molestias aut sint. Laborum enim aut sit assumenda voluptas nisi. Amet earum molestiae molestiae et aut.\n\nEst autem sequi eos dolorem porro ullam reiciendis. Quod veniam et sed. Hic debitis placeat alias eum vel amet sit.', 'https://via.placeholder.com/300x450.png?text=Libro+18', 350, 'Español', 2004, 'Fantasía', 1, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(19, 'Mollitia quam.', '9799432438444', 2, 3, 2, 36.38, NULL, 0, 145, 'Commodi officia aliquam reiciendis. Culpa ut ex unde reprehenderit dolores explicabo. Aut officiis placeat minima qui voluptates. Nihil quod sed qui qui voluptates molestias.\n\nMolestiae occaecati modi libero. Dolorem eligendi voluptas et. Aliquam omnis debitis sint libero voluptas. Earum aut voluptas ut placeat.\n\nEa qui quas et laborum sunt. Nam et et et nihil. Saepe exercitationem tenetur voluptatem et consequuntur. Et qui magnam deserunt magnam iusto.', 'https://via.placeholder.com/300x450.png?text=Libro+19', 259, 'Inglés', 1978, 'Novela Negra', 0, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(20, 'Quidem impedit provident distinctio.', '9780308655157', 3, 4, 2, 31.12, 37.95, 18, 128, 'Voluptatibus optio ipsa possimus ex sed voluptates ut nulla. Quis autem perspiciatis quos voluptatem. Est voluptatem aut et odio eos aperiam rerum. Dicta quidem qui alias cum.\n\nDucimus ut minus quis et. Veritatis tempore provident dolorum laborum totam voluptatem consequatur. Possimus tempore nostrum est magni enim consectetur.\n\nEnim similique fuga molestiae eos labore laboriosam. Ipsam quia eius inventore temporibus illum est rerum. Doloremque molestiae libero qui qui quia.', 'https://via.placeholder.com/300x450.png?text=Libro+20', 150, 'Español', 1996, 'Romance', 0, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(21, 'Placeat qui voluptas et est officia omnis ad.', '9792201298393', 15, 4, 3, 41.15, NULL, 0, 40, 'Sequi rerum quia voluptatem voluptatem saepe dolor. Sunt reiciendis repellendus sequi et cumque laudantium illo a. Qui est voluptatem et nihil cum.\n\nQui quas tenetur dolor in et dicta eum. Tempora iste quibusdam quis nesciunt explicabo nemo.\n\nQuis in officiis quia totam odit aut facilis. Repellendus laudantium totam omnis odit. Hic cum et eos sit incidunt.', 'https://via.placeholder.com/300x450.png?text=Libro+21', 758, 'Español', 1990, 'Arte', 0, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(22, 'Voluptates totam enim qui eos.', '9782983875769', 5, 2, 3, 27.91, 34.89, 20, 59, 'Fugit sit itaque debitis repellat. Sequi aspernatur dolorem est pariatur ducimus. Excepturi inventore harum vero voluptate earum.\n\nVoluptas repellendus voluptas quia maxime itaque molestias adipisci. Et rerum eos tempora rerum dolores. Sapiente iusto id non facere. Fugiat in et enim. Voluptas aliquid error quidem.\n\nNon optio dolores impedit ducimus. Et suscipit quis et alias aliquid molestiae cumque. Et quos earum laborum aut officia corporis maiores dignissimos.', 'https://via.placeholder.com/300x450.png?text=Libro+22', 125, 'Catalán', 2020, 'Cocina', 1, 1, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(23, 'Animi in.', '9791304914599', 9, 4, 3, 17.72, 19.91, 11, 125, 'Corporis quidem consectetur ullam rerum. Suscipit nihil asperiores voluptates aspernatur ullam.\n\nVel nostrum error aperiam vel nesciunt. Dolorem impedit repudiandae velit velit. Iste quaerat culpa dolore similique natus nobis.\n\nVero magni similique eos tempora. Illo voluptas quaerat nemo ab eveniet dolor ea.', 'https://via.placeholder.com/300x450.png?text=Libro+23', 879, 'Español', 2011, 'Poesía', 0, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(24, 'Qui sed ipsam fugit voluptatem.', '9790981082508', 3, 3, 3, 44.60, 50.11, 11, 143, 'Voluptatum libero ut quidem. Vitae autem in debitis earum. Quaerat est blanditiis dolore quasi nulla excepturi.\n\nQuia numquam similique cupiditate pariatur. Ut ut cupiditate quia et at. Vero voluptatem aut libero. Quia quod facere accusantium et.\n\nQuidem aut qui ullam molestiae est corrupti. Doloremque rerum ullam ut ullam nemo voluptatum qui voluptatibus. Voluptatibus eum sequi cupiditate delectus excepturi.', 'https://via.placeholder.com/300x450.png?text=Libro+24', 328, 'Español', 1972, 'Romance', 1, 0, 1, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(25, 'Voluptatem at.', '9787662829446', 13, 3, 2, 8.23, NULL, 0, 33, 'Dolor optio ducimus est eos repudiandae laborum. Consequatur non non ex. Sit et aut ut minus et. Temporibus voluptate ipsa magni.\n\nEst beatae ea quaerat consectetur excepturi iure adipisci. Repellendus aliquam distinctio eum. Sit magnam voluptas est eos perspiciatis quis.\n\nVeniam quia in aut molestiae et similique. Exercitationem et fuga et omnis quo. Architecto aut ea et.', 'https://via.placeholder.com/300x450.png?text=Libro+25', 551, 'Inglés', 1993, 'Romance', 0, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(26, 'Ipsam voluptatum praesentium.', '9798041068721', 5, 1, 1, 18.96, NULL, 0, 84, 'Minima quam officia autem inventore. Quisquam doloremque eos est veritatis autem facilis sapiente. Quod ipsa ut et. Magni facere molestiae et sequi aut nostrum ipsam.\n\nRem porro est nesciunt mollitia voluptatum repellendus. Quibusdam a reiciendis tempora sequi qui laborum. Temporibus praesentium excepturi earum illo autem placeat.\n\nImpedit nam saepe et dolorem et error aut. Vero minus praesentium occaecati. Officia sit perferendis dolorem repellat facilis. Autem quos nisi quia voluptatibus enim dolor.', 'https://via.placeholder.com/300x450.png?text=Libro+26', 275, 'Inglés', 2013, 'Ficción', 0, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(27, 'Voluptas voluptatem cupiditate.', '9789658381525', 5, 4, 3, 26.50, 30.46, 13, 35, 'Eaque eius quia aut. Minus et soluta harum commodi earum facere soluta illum. Numquam consequuntur ipsum aliquam qui at asperiores eveniet.\n\nBeatae assumenda sint est aut repudiandae fugit aut possimus. Est temporibus voluptatem non sed dolorem recusandae non. Corrupti reprehenderit quod qui ut eos dicta. Impedit doloribus pariatur sint voluptas facere.\n\nQuo repellendus cumque harum sint minus qui unde magnam. Quasi aut libero quam sapiente similique est culpa. Quaerat exercitationem tempore sunt veritatis aliquid sint consequatur. Nihil inventore sequi aut necessitatibus.', 'https://via.placeholder.com/300x450.png?text=Libro+27', 746, 'Catalán', 2023, 'Desarrollo Personal', 0, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(28, 'Dicta voluptatem magnam nemo ullam porro ullam.', '9785126206857', 6, 2, 2, 37.49, NULL, 0, 108, 'Quia voluptatem autem nisi in tenetur modi soluta soluta. Porro sunt ad corporis neque ullam iste distinctio. Qui quidem quos dolorem quasi iste reiciendis et. Voluptas eveniet non molestiae voluptas adipisci.\n\nSed saepe cumque sint sed molestiae. Explicabo sit enim dolores ut aut. Enim blanditiis tempora asperiores ipsa. Ut quia ut repudiandae. Qui quia modi et.\n\nRepellendus beatae voluptas explicabo nostrum. Quam cumque sit consequatur dicta. Quis reiciendis sed quos aut aut ipsum a.', 'https://via.placeholder.com/300x450.png?text=Libro+28', 362, 'Catalán', 1997, 'Romance', 1, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(29, 'Porro cum et.', '9795048907497', 14, 3, 3, 29.26, NULL, 0, 147, 'Voluptatem quod velit et totam et asperiores a. Dignissimos temporibus numquam similique dicta culpa reprehenderit non. Maxime quia qui laboriosam minus.\n\nTempora molestiae velit cum et rerum mollitia laudantium. Ipsum aut a soluta a voluptatem numquam repellendus. Qui magni quo ipsa et reprehenderit sit.\n\nDeleniti qui expedita natus corrupti in. Eum est dolorem fuga at ullam. Deleniti quia adipisci eligendi mollitia corporis eius. Quas eligendi iste ab rerum maxime facere dolorem.', 'https://via.placeholder.com/300x450.png?text=Libro+29', 293, 'Español', 2012, 'Desarrollo Personal', 0, 1, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(30, 'Quia impedit et cumque natus.', '9782257885036', 15, 4, 2, 14.03, 15.42, 9, 53, 'Et et a saepe ut fuga. Est maiores laborum debitis architecto cum nulla adipisci sequi. Aut sint qui nesciunt consequuntur qui quia soluta.\n\nA sunt veniam sed placeat dolorum est laboriosam. Omnis libero eum quia perferendis adipisci accusamus. Omnis ut quasi sit ea. Nemo non nobis facere voluptas.\n\nRatione qui autem voluptatem iste ea. Rem praesentium qui atque vitae velit qui et. Odit et fugiat aut.', 'https://via.placeholder.com/300x450.png?text=Libro+30', 319, 'Catalán', 1998, 'Cocina', 0, 0, 1, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(31, 'Quas id.', '9781677899630', 5, 1, 2, 6.50, NULL, 0, 39, 'Dolores ea et minima. Molestiae dolorum velit architecto sint.\n\nQuos voluptatibus sed hic exercitationem consectetur aliquam modi. Nam aut vel modi nobis incidunt. Omnis suscipit omnis aut deleniti blanditiis quia.\n\nNulla voluptatem repellendus ea sequi ut molestiae. Illum excepturi tenetur officia. Dolores doloribus eum sequi veritatis a est.', 'https://via.placeholder.com/300x450.png?text=Libro+31', 113, 'Español', 1985, 'Romance', 0, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(32, 'Qui laboriosam perspiciatis saepe et rerum debitis.', '9798935129651', 9, 2, 1, 24.28, NULL, 0, 121, 'Omnis odit sapiente et quo asperiores vel iste. Nihil minus voluptatem odit ratione. Fugit quidem et dolores commodi ipsum laborum et nobis. Dolores aut sit reiciendis tempora et eos quasi.\n\nMinima eius fugiat natus sed ut ducimus quas fugit. Molestiae qui labore eveniet quas et consequatur. Excepturi optio iure dolore qui occaecati. Ex quos eos cumque necessitatibus et.\n\nQuas nostrum nihil nemo rerum. Quisquam dolorem itaque dolores eligendi fuga error. Consequuntur qui quas et voluptatum minima dignissimos. Accusamus a illum amet tempore doloremque.', 'https://via.placeholder.com/300x450.png?text=Libro+32', 986, 'Inglés', 2022, 'Ficción', 0, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(33, 'Praesentium quisquam architecto architecto.', '9789807056786', 8, 5, 2, 21.29, NULL, 0, 91, 'Est quos consectetur officiis. Maiores dolores architecto assumenda quis. Voluptas ab rerum magni labore. Fugit sunt error non veniam est assumenda ut fugit.\n\nNumquam dolor aspernatur aut perferendis sit. Error dignissimos aut asperiores repellendus sed amet et velit. Alias ut sit fugiat quas quo qui enim.\n\nVeritatis perferendis autem doloremque consequatur explicabo. Qui et fugiat sit velit nulla aut. Aut non atque unde.', 'https://via.placeholder.com/300x450.png?text=Libro+33', 884, 'Español', 2002, 'Desarrollo Personal', 0, 1, 1, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(34, 'Molestiae maxime.', '9795561498465', 4, 5, 3, 20.79, NULL, 0, 135, 'Officia harum omnis asperiores. Sint sint molestiae occaecati totam qui earum. Temporibus est voluptatibus ut pariatur mollitia qui aut. Nihil iusto excepturi quia rerum.\n\nQuas minus molestiae et temporibus possimus neque. Ipsa dolore esse architecto eveniet. Itaque aut exercitationem dolorem ipsam qui harum. Molestiae rem rerum nesciunt.\n\nIusto optio autem iure eum. Distinctio ea dignissimos sunt dolor voluptas. Natus est quam omnis ut. Aut consequuntur autem ut laboriosam id iure qui.', 'https://via.placeholder.com/300x450.png?text=Libro+34', 539, 'Catalán', 1973, 'Romance', 0, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(35, 'Sint laborum aliquam dolorem.', '9789428904947', 9, 1, 3, 37.26, 40.06, 7, 26, 'Voluptates ipsa ea officia molestias provident consectetur fugit. Deleniti veritatis consequatur aut mollitia. Qui et dolorem praesentium error.\n\nAut aut possimus amet totam libero sunt velit. Amet a maiores esse. Aut sunt dolorem accusamus ut.\n\nQui nostrum aut quo. Occaecati in at asperiores consequatur impedit. Architecto eum quis qui omnis. Incidunt autem nam ut exercitationem voluptatem dolores fuga.', 'https://via.placeholder.com/300x450.png?text=Libro+35', 336, 'Español', 1975, 'Misterio', 0, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(36, 'Animi sit ut est ullam non.', '9795767483951', 3, 5, 2, 27.32, NULL, 0, 10, 'Amet sunt suscipit rerum. Tenetur iusto nobis blanditiis libero aperiam. Fugit libero adipisci molestias et. Reprehenderit nihil consequuntur dolorem tenetur aliquam placeat.\n\nQuis non veritatis deserunt ratione. Dolore quo perferendis soluta soluta.\n\nUt quod recusandae et expedita perferendis amet est. Dolorem aut neque sit ipsam repellat iusto.', 'https://via.placeholder.com/300x450.png?text=Libro+36', 942, 'Español', 1993, 'Romance', 0, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(37, 'Totam vero adipisci magnam necessitatibus repellendus eos qui.', '9793673543875', 10, 3, 3, 12.98, NULL, 0, 33, 'Libero explicabo aut consequatur incidunt. Illo incidunt ducimus est exercitationem iusto distinctio. Molestias et accusantium nemo repudiandae optio distinctio nisi.\n\nMolestiae sint architecto sint facilis tempora sapiente nam. Rem labore veritatis eum odio assumenda. Et optio qui ut et porro eaque ut impedit. Commodi tempore vel vitae.\n\nQuo voluptatem accusamus deserunt rerum ad vitae. Natus dolorem maiores sapiente nostrum et ratione adipisci. Optio dicta enim laboriosam.', 'https://via.placeholder.com/300x450.png?text=Libro+37', 926, 'Español', 2015, 'Misterio', 0, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(38, 'Autem dolor dolorem quae soluta.', '9781404744110', 15, 1, 1, 10.53, NULL, 0, 13, 'Qui voluptatem aperiam nobis ut eius qui alias. Praesentium et ipsum quasi est labore non. Fuga non earum ea nobis facilis voluptatem occaecati.\n\nRem suscipit natus consequatur eos. Unde nam tempore et vitae. Adipisci officiis repudiandae ut quidem architecto ducimus molestias omnis.\n\nNobis mollitia eveniet distinctio perspiciatis. Architecto et consequatur non dicta. Nostrum nihil maiores sit ab vero voluptatem ut.', 'https://via.placeholder.com/300x450.png?text=Libro+38', 879, 'Español', 1988, 'Fantasía', 1, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(39, 'Sapiente explicabo architecto animi dicta dolores qui.', '9796016779214', 6, 5, 2, 36.68, NULL, 0, 89, 'Assumenda dolor qui blanditiis ex necessitatibus. Ea qui ea soluta et veritatis. Fuga praesentium rerum aspernatur beatae. Et dolorum quas qui dolor animi voluptas. Minus itaque tenetur voluptatum architecto explicabo asperiores.\n\nNumquam occaecati necessitatibus omnis nostrum quidem non asperiores rem. Ipsum animi aut error maiores provident provident suscipit. Quasi architecto ab unde dolore quisquam harum ut. Repudiandae distinctio saepe incidunt.\n\nExplicabo dolorem quasi et eum. Dolores rerum odio id quo. Recusandae magnam corrupti nisi. Voluptatem commodi amet unde consequuntur fugit sit et.', 'https://via.placeholder.com/300x450.png?text=Libro+39', 491, 'Español', 2005, 'Fantasía', 1, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(40, 'Voluptas officiis eum quis voluptas.', '9797561740131', 14, 2, 3, 13.85, NULL, 0, 131, 'Impedit voluptates consectetur ut dolore omnis eveniet ad. A quis reprehenderit quia repellendus labore beatae qui autem. Laboriosam dolore quod maiores repudiandae consequatur. Perferendis necessitatibus pariatur sed occaecati unde non sapiente.\n\nRepellat impedit enim tempore voluptatum fugiat. Dolorum nesciunt molestiae neque consectetur aut fugit. Corrupti est minus sed hic animi ut. Ex sed consequatur veniam alias.\n\nDoloremque voluptate quia culpa aliquid dolores. Nulla voluptatum quibusdam maxime cumque. Ut quis tenetur quia nesciunt sit dolorem aspernatur quia.', 'https://via.placeholder.com/300x450.png?text=Libro+40', 718, 'Inglés', 2014, 'Desarrollo Personal', 1, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(41, 'Facere sunt quod error.', '9781596840829', 9, 4, 1, 13.01, NULL, 0, 52, 'Sunt sit veritatis dolore neque dolorem error. Eveniet sed et atque quia labore soluta. Deserunt possimus aut quia est qui fugit earum.\n\nFugiat ipsa soluta culpa ad. Autem qui a ab vel. Sit itaque autem quasi commodi autem. Occaecati molestias laudantium ut facilis. Assumenda laboriosam nam qui qui voluptatem at aut officiis.\n\nConsequatur culpa et molestiae temporibus. Mollitia optio iste et ut quam dignissimos est. Eius facere eos consequatur similique sed quod. Repudiandae sed eos consectetur porro quia maiores eos.', 'https://via.placeholder.com/300x450.png?text=Libro+41', 153, 'Inglés', 1995, 'Poesía', 0, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(42, 'Distinctio provident non aut vel facilis.', '9798330321070', 13, 2, 3, 15.19, NULL, 0, 129, 'Aut nostrum facere et rerum atque nulla doloribus quasi. Aliquam ut fuga ab magni qui atque magnam. Beatae totam laboriosam cupiditate natus.\n\nFuga dolorem voluptatibus ab. Consequatur reiciendis quasi aut debitis repellendus illo. Et dolores omnis corrupti repudiandae nihil. Architecto eum similique qui quia id dolorem nulla.\n\nMolestiae repellat tempore commodi ipsa porro et maiores. Dolor et sunt eaque quo. Illo nemo laboriosam accusamus odio est. Nisi quia in officiis et voluptas.', 'https://via.placeholder.com/300x450.png?text=Libro+42', 949, 'Inglés', 1979, 'Misterio', 0, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(43, 'Quia quam esse fuga velit minus quis a tempore.', '9784539992258', 3, 3, 2, 10.00, NULL, 0, 112, 'Qui numquam omnis aut. Vitae corrupti explicabo labore pariatur iure. Vel expedita in corporis expedita in.\n\nDeserunt suscipit dolorem et veritatis harum molestiae non reiciendis. Veritatis aliquam fuga quis optio doloremque eum. Minus distinctio sed voluptatibus praesentium ipsa.\n\nEos ad placeat quas sunt. Accusamus nemo debitis sunt qui sint dolorum omnis. Velit repellendus voluptatibus eos quod quae. Qui iusto in commodi ab rerum.', 'https://via.placeholder.com/300x450.png?text=Libro+43', 610, 'Inglés', 1992, 'Novela Negra', 0, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(44, 'Quasi soluta voluptate sit enim.', '9787776332085', 9, 4, 3, 26.18, 29.75, 12, 109, 'Sint assumenda cupiditate repudiandae. Labore placeat et quia vero quia. Placeat ullam ut voluptatem distinctio culpa nulla harum. Aut quae sit eligendi soluta.\n\nAccusantium expedita dolore facilis recusandae. Vel eligendi sunt est rerum provident magni deserunt. Velit aut expedita ducimus at ad sapiente. Dolor dolores sed in numquam.\n\nMolestias quaerat eos laborum deserunt dignissimos ipsa et. Voluptates reiciendis sit distinctio ipsum. Ipsa ad autem vitae et. Dolor illum autem qui.', 'https://via.placeholder.com/300x450.png?text=Libro+44', 908, 'Español', 2022, 'Romance', 0, 1, 1, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(45, 'Dolor necessitatibus aut eum tempore reprehenderit.', '9780065167719', 5, 1, 2, 22.08, 25.09, 12, 129, 'Quia sed amet animi libero rerum sed deserunt. Voluptatem deserunt ut mollitia voluptatem amet ullam. Culpa et eum voluptas dolor nihil. Id adipisci soluta ipsa pariatur voluptate eum placeat repellat.\n\nVoluptas expedita reprehenderit enim eum dolores voluptatem temporibus eligendi. Repellat accusamus quos nobis aut ut. Ut quia ipsa eos velit quidem.\n\nVoluptate qui iure non quia. Odit rem rerum velit sed quod. Et repudiandae enim perspiciatis aut perspiciatis est.', 'https://via.placeholder.com/300x450.png?text=Libro+45', 623, 'Inglés', 1998, 'Historia', 0, 1, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(46, 'Ut repellat quia.', '9794372202476', 8, 1, 2, 18.95, NULL, 0, 48, 'Commodi ut eaque praesentium. Qui impedit fugiat est ea magnam consectetur ut. Ut fuga quasi omnis est blanditiis ut rerum in. Ut enim saepe sed repudiandae velit possimus.\n\nEt vel et nihil accusamus et ipsum. Laudantium suscipit quidem ullam perferendis officiis vel. Ut eum odit autem quasi doloribus asperiores.\n\nMolestiae necessitatibus neque distinctio natus numquam fugiat a. Sit a facilis ea voluptas rerum. Quae qui dolorem necessitatibus est.', 'https://via.placeholder.com/300x450.png?text=Libro+46', 831, 'Inglés', 2023, 'Ficción', 1, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(47, 'Velit voluptate cupiditate.', '9782545313258', 13, 5, 3, 39.67, 47.80, 17, 111, 'Eaque perspiciatis sequi in qui qui aspernatur. Porro porro dignissimos labore molestiae qui labore.\n\nUt et natus sint minus quaerat fuga iusto. Ipsa odit qui voluptatem perferendis adipisci sunt. Maiores blanditiis aut est rerum. Saepe voluptas dolore expedita atque id sit aut.\n\nIncidunt suscipit ut ut aspernatur. Vel nesciunt perferendis omnis. Nihil quaerat ipsa qui vel.', 'https://via.placeholder.com/300x450.png?text=Libro+47', 653, 'Catalán', 1974, 'Misterio', 0, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(48, 'Sit facilis dolorem at ut.', '9780157835007', 10, 1, 2, 21.83, 23.73, 8, 60, 'Animi hic ullam rerum sit ratione est qui. Labore consequatur sint iusto. Laudantium inventore sint aut nulla facilis vel impedit.\n\nEst harum illum architecto magni. Dolores earum animi quisquam. Dolorem illum consequatur est aut. Reiciendis reprehenderit sit sed quaerat cumque. Aut blanditiis quisquam autem.\n\nCumque magni et explicabo aut et nisi sint. Unde mollitia quas ducimus ab itaque. Ab voluptas non vitae minima neque reprehenderit quam.', 'https://via.placeholder.com/300x450.png?text=Libro+48', 725, 'Español', 1976, 'Fantasía', 0, 1, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(49, 'Dolores molestiae molestias.', '9792679134797', 15, 2, 3, 15.05, NULL, 0, 104, 'Officiis optio dolorem voluptas hic doloribus voluptatem voluptatem. Ut ab optio est quibusdam qui dignissimos sit. Facilis nemo recusandae optio possimus repellat est. Qui dolorem quas quibusdam cupiditate aut.\n\nExpedita debitis quaerat maiores modi est non. Doloremque ad totam minus sunt. Consectetur nostrum dolorem quas ut quos. Dolorem in aut minus consequatur dolore nihil.\n\nItaque ipsa ea minus voluptatem. Expedita excepturi error quis perspiciatis. Animi earum non error aspernatur.', 'https://via.placeholder.com/300x450.png?text=Libro+49', 637, 'Inglés', 2017, 'Ficción', 1, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(50, 'Dolorum quaerat fugiat voluptatem et fugiat quo.', '9792794477571', 11, 3, 2, 6.51, NULL, 0, 45, 'Iusto necessitatibus ea perferendis omnis maiores. Ut necessitatibus voluptas tempore repudiandae modi ex. Est quis culpa qui inventore. Cumque corrupti placeat voluptas quia a. Quaerat facere voluptas cumque id.\n\nIste expedita qui laboriosam et accusamus. In ullam sunt aut sapiente et. Officia eos voluptate assumenda qui maiores ipsam dolor.\n\nVoluptas autem sint et aperiam voluptates saepe. Ipsa consequatur recusandae quis. Pariatur iste et aspernatur.', 'https://via.placeholder.com/300x450.png?text=Libro+50', 895, 'Catalán', 2016, 'Historia', 1, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(51, 'Consequuntur perferendis illo hic sit.', '9783747288498', 8, 1, 2, 29.73, NULL, 0, 127, 'Cupiditate qui itaque maiores eveniet sed. Soluta iusto et unde ut culpa nesciunt nobis.\n\nAut repellat iure consectetur ut enim quisquam et. Voluptas voluptas dolorum et voluptas illum non sed. Sunt impedit iure voluptatem vel ullam occaecati eligendi laboriosam. Illo molestias tenetur quam ea sit ea inventore.\n\nQuisquam architecto itaque ea deserunt eveniet voluptatem provident. Voluptatem eveniet possimus cupiditate dolores. Sint praesentium vel maiores est laborum repudiandae ex dolorum. Aspernatur labore voluptas labore.', 'https://via.placeholder.com/300x450.png?text=Libro+51', 780, 'Catalán', 1981, 'Romance', 0, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(52, 'Culpa velit voluptatem sint.', '9785775771980', 5, 1, 1, 22.78, NULL, 0, 2, 'Eos iure qui labore ut dolorum tenetur consequatur. Ex expedita dolores vel quis.\n\nQuod quaerat corporis voluptatem eaque asperiores quasi quos placeat. Qui voluptas saepe eum et quis velit ad. Aliquam modi reiciendis porro vitae amet repellat.\n\nConsequatur impedit laboriosam a qui vitae incidunt aut. A ex nam ea rem. Eveniet eaque saepe totam ut. Qui consequatur quibusdam assumenda hic.', 'https://via.placeholder.com/300x450.png?text=Libro+52', 292, 'Español', 1975, 'Poesía', 0, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(53, 'Similique totam quam adipisci sit porro eaque.', '9782027946042', 14, 5, 2, 37.92, 44.09, 14, 77, 'Eos qui itaque occaecati voluptates. Id tenetur et minima. Assumenda libero culpa eius earum est saepe culpa enim.\n\nVoluptas laboriosam nulla natus ut. Blanditiis quod ratione minima excepturi sapiente ipsum. Commodi enim autem voluptas rerum vel nobis suscipit. Ipsum ducimus placeat laborum.\n\nDolor odio animi est. Voluptas quae velit illum id qui dolore.', 'https://via.placeholder.com/300x450.png?text=Libro+53', 466, 'Español', 2022, 'Poesía', 1, 0, 1, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(54, 'Autem ratione odit occaecati expedita.', '9781393577096', 3, 1, 2, 38.45, NULL, 0, 141, 'Aut molestias id illo fuga. Sunt voluptas voluptas qui inventore aut iure. Tempora velit asperiores fugit suscipit placeat doloribus nobis. Et porro inventore qui quia quasi ut.\n\nDicta eaque in autem qui. Odit veniam distinctio asperiores aut commodi suscipit. Dolorem sunt delectus consequatur eum voluptates aliquid. Id perspiciatis aut ut reiciendis.\n\nDignissimos quis expedita eum reiciendis ipsa possimus earum. Rerum repellat quis occaecati sed rerum ipsum. Omnis quis nihil molestias nemo beatae sint. Laudantium sunt sed consequatur.', 'https://via.placeholder.com/300x450.png?text=Libro+54', 346, 'Catalán', 2010, 'Fantasía', 0, 1, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(55, 'Provident libero.', '9795611692584', 15, 2, 3, 17.35, NULL, 0, 74, 'Reiciendis vel facilis quas natus. Ad et perferendis et voluptas optio. Illo veniam harum aspernatur eius. Corporis et dolor illum optio qui.\n\nDoloribus sed est fuga voluptatem et reprehenderit. Qui porro dolores dolorem et facere ut necessitatibus. Sed amet ex velit animi voluptas. Voluptas vero est neque ducimus ab nisi.\n\nDelectus repudiandae in similique quia est ducimus. Accusantium necessitatibus suscipit nihil atque aut hic nostrum placeat. Rerum ducimus similique et ullam dolores ut. Voluptas ipsum in dolores ipsum.', 'https://via.placeholder.com/300x450.png?text=Libro+55', 490, 'Español', 2010, 'Ficción', 0, 1, 1, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(56, 'Pariatur fugit quis saepe.', '9782615626424', 5, 1, 1, 14.15, 16.08, 12, 81, 'Unde cum reprehenderit eaque dolorem dolores. Quo porro quas voluptates minus et et sit. Molestiae praesentium totam tenetur nihil maiores unde. Doloribus repellendus dolorum autem commodi.\n\nQuae occaecati ex quia. Ipsa possimus aliquam incidunt id est voluptatem harum. Minus enim architecto ut et unde. Fugit dolore quasi recusandae quidem est. Eos quibusdam quasi magni eos id consequatur.\n\nNihil in atque vero unde. Et suscipit totam nesciunt dignissimos et vero corporis. Quis numquam qui et natus quasi tempore laborum aut.', 'https://via.placeholder.com/300x450.png?text=Libro+56', 194, 'Español', 2016, 'Cocina', 1, 0, 0, '2026-04-13 12:16:01', '2026-04-13 12:16:01'),
(57, 'Ut iste vitae.', '9783618626046', 14, 4, 1, 17.46, NULL, 0, 87, 'Ut repudiandae vitae et est veritatis provident ea consequatur. Animi consequatur repudiandae dolor sit rerum ut modi. Sed sed ratione beatae quia explicabo rerum laborum. Voluptates odio sapiente cum quidem cumque quia.\n\nHic voluptas voluptates doloremque nulla. Debitis sint minima ut officiis. Ut minus quis unde nulla autem facilis.\n\nTotam commodi commodi aperiam quisquam aliquam. Et voluptatem sed tempora occaecati et. Est dolorem velit soluta doloremque eum id excepturi. Sed accusantium praesentium minus sit sit occaecati esse.', 'https://via.placeholder.com/300x450.png?text=Libro+57', 603, 'Español', 2006, 'Poesía', 0, 0, 0, '2026-04-13 12:16:01', '2026-04-14 13:10:37'),
(58, 'Est id quam odio laboriosam voluptate doloremque.', '9787392517453', 3, 1, 1, 35.77, NULL, 0, 110, 'Commodi ea quaerat consequuntur ipsa officiis debitis et ut. Perferendis eum aut aut et aspernatur. Possimus nisi et quos totam rerum.\n\nQuod autem soluta non excepturi temporibus unde. Ipsum quisquam sapiente voluptatem sit blanditiis. Velit eum est ullam ea.\n\nA adipisci est molestiae est ipsam non sit. Quis ab quis et illum vel temporibus omnis expedita. Ut ut ducimus aut ut nihil incidunt nobis.', 'https://via.placeholder.com/300x450.png?text=Libro+58', 696, 'Inglés', 2022, 'Misterio', 0, 0, 0, '2026-04-13 12:16:01', '2026-04-14 13:10:37'),
(59, 'Deleniti laborum molestiae voluptatibus autem unde.', '9794789736458', 7, 4, 2, 22.56, 25.07, 10, 82, 'Ut quia delectus nihil tempora. Voluptatem totam rerum labore minima. Occaecati esse soluta quas enim dolores amet.\n\nEos veritatis facilis velit sunt. Autem pariatur vel possimus voluptas repudiandae et qui quia. Sint et dolor ut dolore aut omnis est.\n\nVelit et sint assumenda. Vel qui nulla vel dignissimos exercitationem maiores vero eligendi. Deleniti ab non nobis eum possimus. Ratione consequuntur explicabo sit laudantium et nam perspiciatis. Temporibus explicabo cupiditate pariatur recusandae fugit voluptatibus possimus.', 'https://via.placeholder.com/300x450.png?text=Libro+59', 648, 'Español', 2013, 'Poesía', 0, 0, 0, '2026-04-13 12:16:01', '2026-04-14 16:15:16'),
(60, 'Est nostrum accusamus voluptate nihil.', '9782529161097', 3, 5, 3, 14.57, NULL, 0, 37, 'Earum tempora dignissimos ex totam doloribus. Deleniti mollitia veritatis exercitationem qui neque ea odio. Mollitia nemo molestias qui nostrum.\n\nAnimi eum mollitia vitae. Consequatur dolorem provident velit aperiam explicabo voluptas. Cum consectetur sunt dicta beatae dolore deserunt.\n\nLaudantium perspiciatis blanditiis enim provident mollitia. Sunt sit corporis eaque enim. Eum numquam dignissimos consequuntur qui. Quia fuga nobis mollitia laborum perferendis et.', 'https://via.placeholder.com/300x450.png?text=Libro+60', 271, 'Catalán', 1997, 'Romance', 0, 1, 0, '2026-04-13 12:16:01', '2026-04-14 16:15:16'),
(61, 'Richard y su perfume', '978987925489373', 14, 5, 1, 50.00, NULL, 0, 2, 'Un libro escrito desde el corazón', NULL, 256, 'Español', 2021, NULL, 1, 0, 0, '2026-04-14 14:19:14', '2026-04-14 15:32:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `book_tag`
--

CREATE TABLE `book_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `book_tag`
--

INSERT INTO `book_tag` (`id`, `book_id`, `tag_id`) VALUES
(1, 1, 10),
(2, 1, 9),
(3, 2, 6),
(4, 3, 9),
(5, 3, 7),
(6, 4, 10),
(7, 4, 1),
(8, 5, 4),
(9, 5, 10),
(10, 6, 2),
(11, 6, 5),
(12, 6, 4),
(13, 7, 1),
(14, 7, 5),
(15, 8, 3),
(16, 8, 4),
(17, 9, 6),
(18, 9, 1),
(19, 10, 3),
(20, 11, 10),
(21, 11, 7),
(22, 12, 4),
(23, 12, 8),
(24, 13, 6),
(25, 13, 9),
(26, 13, 10),
(27, 14, 2),
(28, 14, 8),
(29, 14, 10),
(30, 15, 8),
(31, 15, 6),
(32, 15, 2),
(33, 16, 2),
(34, 17, 1),
(35, 17, 2),
(36, 18, 7),
(37, 19, 8),
(38, 20, 2),
(39, 21, 4),
(40, 21, 1),
(41, 22, 4),
(42, 22, 2),
(43, 22, 1),
(44, 23, 9),
(45, 23, 4),
(46, 24, 6),
(47, 24, 9),
(48, 24, 5),
(49, 25, 2),
(50, 25, 4),
(51, 25, 9),
(52, 26, 10),
(53, 27, 10),
(54, 28, 10),
(55, 28, 7),
(56, 29, 7),
(57, 29, 4),
(58, 29, 2),
(59, 30, 9),
(60, 30, 6),
(61, 30, 8),
(62, 31, 1),
(63, 31, 9),
(64, 32, 9),
(65, 32, 8),
(66, 32, 4),
(67, 33, 1),
(68, 33, 10),
(69, 34, 5),
(70, 34, 4),
(71, 34, 7),
(72, 35, 3),
(73, 35, 9),
(74, 36, 3),
(75, 36, 10),
(76, 36, 7),
(77, 37, 10),
(78, 37, 6),
(79, 37, 2),
(80, 38, 10),
(81, 38, 2),
(82, 39, 6),
(83, 39, 4),
(84, 40, 1),
(85, 40, 7),
(86, 41, 4),
(87, 42, 6),
(88, 43, 6),
(89, 43, 7),
(90, 44, 9),
(91, 45, 3),
(92, 45, 6),
(93, 46, 10),
(94, 46, 7),
(95, 47, 1),
(96, 48, 3),
(97, 48, 8),
(98, 49, 8),
(99, 50, 4),
(100, 50, 7),
(101, 51, 8),
(102, 52, 5),
(103, 52, 9),
(104, 52, 3),
(105, 53, 4),
(106, 54, 7),
(107, 54, 10),
(108, 55, 3),
(109, 55, 2),
(110, 55, 10),
(111, 56, 10),
(112, 56, 7),
(113, 57, 10),
(114, 57, 3),
(115, 58, 3),
(116, 58, 2),
(117, 58, 9),
(118, 59, 1),
(119, 59, 9),
(120, 59, 8),
(121, 60, 4);

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
(5, 'Tiempo Libre', 'tiempo-libre', '2026-04-13 12:16:01', '2026-04-13 12:16:01');

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
(1, 'tomas pp', 'tomas@email.com', 'Pedido', 'Cuando sale mi pedido', '2026-04-14 13:10:19', '2026-04-14 13:10:19');

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
(3, 'NIF2785', 'toto', 'werw', 'tu@email.com', '$2y$12$njSa/jUyZYJ5rN23IHaJe.u64uwUNsBYJLOJlOBbx1Pz/ugIFfAZe', NULL, NULL, NULL, 0, '2026-04-14 16:17:19', '2026-04-14 16:17:19', NULL);

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
(4, 2, 'pending', 37.13, 0.00, 0.00, 37.13, NULL, '2026-04-14 16:15:16', '2026-04-14 16:15:16');

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

--
-- Volcado de datos para la tabla `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `book_id`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(1, 1, 60, 1, 14.57, '2026-04-14 11:43:49', '2026-04-14 11:43:49'),
(2, 1, 59, 2, 22.56, '2026-04-14 11:43:49', '2026-04-14 11:43:49'),
(3, 1, 58, 1, 35.77, '2026-04-14 11:43:49', '2026-04-14 11:43:49'),
(4, 1, 57, 1, 17.46, '2026-04-14 11:43:49', '2026-04-14 11:43:49'),
(5, 2, 60, 2, 14.57, '2026-04-14 13:10:37', '2026-04-14 13:10:37'),
(6, 2, 59, 1, 22.56, '2026-04-14 13:10:37', '2026-04-14 13:10:37'),
(7, 2, 58, 1, 35.77, '2026-04-14 13:10:37', '2026-04-14 13:10:37'),
(8, 2, 57, 1, 17.46, '2026-04-14 13:10:37', '2026-04-14 13:10:37'),
(9, 3, 61, 1, 50.00, '2026-04-14 15:32:47', '2026-04-14 15:32:47'),
(10, 3, 60, 1, 14.57, '2026-04-14 15:32:47', '2026-04-14 15:32:47'),
(11, 4, 60, 1, 14.57, '2026-04-14 16:15:16', '2026-04-14 16:15:16'),
(12, 4, 59, 1, 22.56, '2026-04-14 16:15:16', '2026-04-14 16:15:16');

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
(11, 'App\\Models\\User', 1, 'admin-token', '781c2ac20424b5b7723e050a2df88481dbfa48de7f8ca6bad2d84bcb3282ea09', '[\"*\"]', '2026-04-14 16:21:01', NULL, '2026-04-14 16:19:00', '2026-04-14 16:21:01');

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

--
-- Volcado de datos para la tabla `reviews`
--

INSERT INTO `reviews` (`id`, `customer_id`, `book_id`, `rating`, `comment`, `created_at`, `updated_at`) VALUES
(1, 1, 53, 5, 'Muy bueno', '2026-04-14 13:09:45', '2026-04-14 13:09:45'),
(2, 1, 3, 3, 'Estupendo!', '2026-04-14 13:10:02', '2026-04-14 13:10:02');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de la tabla `book_tag`
--
ALTER TABLE `book_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
