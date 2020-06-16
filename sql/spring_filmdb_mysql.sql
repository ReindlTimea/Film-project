-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2020. Jún 16. 11:46
-- Kiszolgáló verziója: 10.4.11-MariaDB
-- PHP verzió: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `spring_filmdb`
--
CREATE DATABASE IF NOT EXISTS `spring_filmdb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `spring_filmdb`;

DELIMITER $$
--
-- Eljárások
--
DROP PROCEDURE IF EXISTS `GetAllGenre`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllGenre` ()  NO SQL
SELECT * FROM genres$$

DROP PROCEDURE IF EXISTS `GetAllPeopleHaveRole`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllPeopleHaveRole` ()  NO SQL
SELECT people.*, roles.roleid, roles.role_name, roletypes.role_type_name, films.* FROM people
INNER JOIN roles ON people.peopleid = roles.peopleid
INNER JOIN films ON roles.filmid = films.filmid
INNER JOIN roletypes ON roles.role_typeid = roletypes.role_typeid$$

DROP PROCEDURE IF EXISTS `GetFemale`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFemale` ()  NO SQL
SELECT * FROM people WHERE people.gender = 0$$

DROP PROCEDURE IF EXISTS `GetFilmRate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFilmRate` (IN `filmid` INT UNSIGNED)  NO SQL
SELECT films.*, filmrates.star_count, filmrates.film_rate_comment, users.userid, users.user_name FROM filmrates
LEFT JOIN films ON films.filmid = filmrates.filmid
LEFT JOIN users ON users.userid = filmrates.userid
WHERE filmrates.filmid = filmid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `favorite_film`
--

DROP TABLE IF EXISTS `favorite_film`;
CREATE TABLE `favorite_film` (
  `userid` bigint(20) NOT NULL,
  `filmid` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `favorite_film`
--

INSERT INTO `favorite_film` (`userid`, `filmid`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `favorite_genre`
--

DROP TABLE IF EXISTS `favorite_genre`;
CREATE TABLE `favorite_genre` (
  `userid` bigint(20) NOT NULL,
  `genreid` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `favorite_genre`
--

INSERT INTO `favorite_genre` (`userid`, `genreid`) VALUES
(1, 1),
(2, 17);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `favorite_people`
--

DROP TABLE IF EXISTS `favorite_people`;
CREATE TABLE `favorite_people` (
  `userid` bigint(20) NOT NULL,
  `peopleid` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `favorite_people`
--

INSERT INTO `favorite_people` (`userid`, `peopleid`) VALUES
(1, 1),
(2, 4);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `filmrates`
--

DROP TABLE IF EXISTS `filmrates`;
CREATE TABLE `filmrates` (
  `film_rateid` bigint(20) NOT NULL,
  `filmid` bigint(20) NOT NULL,
  `film_rate_comment` varchar(255) DEFAULT NULL,
  `star_count` int(11) NOT NULL,
  `userid` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `filmrates`
--

INSERT INTO `filmrates` (`film_rateid`, `filmid`, `film_rate_comment`, `star_count`, `userid`) VALUES
(1, 1, 'Great film', 10, 1),
(2, 1, 'Cool movie.', 9, 2);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `filmrate_seq`
--

DROP TABLE IF EXISTS `filmrate_seq`;
CREATE TABLE `filmrate_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `filmrate_seq`
--

INSERT INTO `filmrate_seq` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `films`
--

DROP TABLE IF EXISTS `films`;
CREATE TABLE `films` (
  `filmid` bigint(20) NOT NULL,
  `film_description` varchar(255) DEFAULT NULL,
  `film_length_mins` int(11) NOT NULL,
  `film_original_title` varchar(255) NOT NULL,
  `film_release_date` datetime DEFAULT NULL,
  `film_sub_title` varchar(255) DEFAULT NULL,
  `film_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `films`
--

INSERT INTO `films` (`filmid`, `film_description`, `film_length_mins`, `film_original_title`, `film_release_date`, `film_sub_title`, `film_type`) VALUES
(1, '', 115, 'Demolition Man', '1993-10-07 01:00:00', '', 'movie'),
(2, '', 116, 'Back to the Future', '1985-07-03 02:00:00', '', 'movie'),
(3, '', 84, 'Ace Ventura', '1994-02-04 01:00:00', 'Pet Detective', 'movie'),
(4, '', 46, 'Star Trek: Voyager', '1995-01-23 01:00:00', 'Parallax', 'series');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `film_genre`
--

DROP TABLE IF EXISTS `film_genre`;
CREATE TABLE `film_genre` (
  `filmid` bigint(20) NOT NULL,
  `genreid` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `film_genre`
--

INSERT INTO `film_genre` (`filmid`, `genreid`) VALUES
(1, 1),
(2, 17),
(3, 22),
(4, 17);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `film_seq`
--

DROP TABLE IF EXISTS `film_seq`;
CREATE TABLE `film_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `film_seq`
--

INSERT INTO `film_seq` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `genres`
--

DROP TABLE IF EXISTS `genres`;
CREATE TABLE `genres` (
  `genreid` bigint(20) NOT NULL,
  `genre_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `genres`
--

INSERT INTO `genres` (`genreid`, `genre_name`) VALUES
(1, 'akció'),
(2, 'animációs'),
(3, 'bűnügyi'),
(4, 'családi'),
(5, 'dokumentum'),
(6, 'dráma'),
(7, 'életrajzi'),
(8, 'erotikus'),
(9, 'fantasy'),
(10, 'háborús'),
(11, 'horror'),
(12, 'kaland'),
(13, 'katasztrófa'),
(14, 'koncert'),
(15, 'misztikus'),
(16, 'romantikus'),
(17, 'sci-fi'),
(18, 'természet'),
(19, 'thriller'),
(20, 'történelmi'),
(21, 'tudományos'),
(22, 'vígjáték'),
(23, 'western'),
(24, 'zenés');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `genre_seq`
--

DROP TABLE IF EXISTS `genre_seq`;
CREATE TABLE `genre_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `genre_seq`
--

INSERT INTO `genre_seq` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `people`
--

DROP TABLE IF EXISTS `people`;
CREATE TABLE `people` (
  `peopleid` bigint(20) NOT NULL,
  `biography` varchar(255) DEFAULT NULL,
  `born_country` varchar(255) DEFAULT NULL,
  `born_date` datetime DEFAULT NULL,
  `born_place` varchar(255) DEFAULT NULL,
  `gender` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `people`
--

INSERT INTO `people` (`peopleid`, `biography`, `born_country`, `born_date`, `born_place`, `gender`, `name`) VALUES
(1, '', 'USA', '1956-07-09 02:00:00', 'Concord, California', 1, 'Tom Hanks'),
(2, '', 'USA', '1964-07-26 01:00:00', 'Arlington, Virginia', 0, 'Sandra Bullock'),
(3, '', 'USA', '1937-06-01 01:00:00', 'Memphis, Tennessee', 1, 'Morgan Freeman'),
(4, '', 'Austria', '1947-07-30 02:00:00', 'Thal, Styria', 1, 'Arnold Schwarzenegger'),
(5, '', 'USA', '1946-07-06 02:00:00', 'New York City, New York', 1, 'Sylvester Stallone');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `people_seq`
--

DROP TABLE IF EXISTS `people_seq`;
CREATE TABLE `people_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `people_seq`
--

INSERT INTO `people_seq` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `profession`
--

DROP TABLE IF EXISTS `profession`;
CREATE TABLE `profession` (
  `peopleid` bigint(20) NOT NULL,
  `role_typeid` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `profession`
--

INSERT INTO `profession` (`peopleid`, `role_typeid`) VALUES
(1, 1),
(2, 12),
(3, 1),
(4, 1),
(5, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `roleid` bigint(20) NOT NULL,
  `filmid` bigint(20) NOT NULL,
  `peopleid` bigint(20) NOT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  `role_typeid` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `roles`
--

INSERT INTO `roles` (`roleid`, `filmid`, `peopleid`, `role_name`, `role_typeid`) VALUES
(1, 1, 5, 'John Spartan', 1),
(2, 1, 2, 'Lenina Huxley', 12);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `roletypes`
--

DROP TABLE IF EXISTS `roletypes`;
CREATE TABLE `roletypes` (
  `role_typeid` bigint(20) NOT NULL,
  `role_type_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `roletypes`
--

INSERT INTO `roletypes` (`role_typeid`, `role_type_name`) VALUES
(1, 'színész'),
(2, 'producer'),
(3, 'rendező'),
(4, 'forgatókönyvíró'),
(5, 'zene'),
(6, 'operatőr'),
(7, 'vágó'),
(8, 'jelmeztervező'),
(9, 'díszlettervező'),
(10, 'látványtervező'),
(11, 'vezető producer'),
(12, 'színésznő');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `roletype_seq`
--

DROP TABLE IF EXISTS `roletype_seq`;
CREATE TABLE `roletype_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `roletype_seq`
--

INSERT INTO `roletype_seq` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `role_seq`
--

DROP TABLE IF EXISTS `role_seq`;
CREATE TABLE `role_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `role_seq`
--

INSERT INTO `role_seq` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `userid` bigint(20) NOT NULL,
  `user_born_date` date DEFAULT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_gender` int(11) DEFAULT NULL,
  `user_is_admin` int(11) NOT NULL,
  `user_last_login` datetime DEFAULT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_reg_date` datetime DEFAULT NULL,
  `user_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`userid`, `user_born_date`, `user_email`, `user_gender`, `user_is_admin`, `user_last_login`, `user_name`, `user_password`, `user_reg_date`, `user_status`) VALUES
(1, '1983-12-17', 'seven@email.com', 0, 1, '2020-06-16 09:24:25', 'Seven', '$2a$10$9ThhJxR/R9y42A9n2rIBnu8S5ImOSez8MYSzpmQ2.sBmaGG4ClZ.q', '2020-06-16 09:24:25', 1),
(2, '1980-07-22', 'species8472@email.com', 1, 0, '2020-06-16 09:24:25', 'Species8472', '$2a$10$k1CswVA20dESk8ztupVy1eXg7zf06H3NI/ebbsldkOb7jm3j96CiG', '2020-06-16 09:24:25', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user_seq`
--

DROP TABLE IF EXISTS `user_seq`;
CREATE TABLE `user_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `user_seq`
--

INSERT INTO `user_seq` (`next_val`) VALUES
(101);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `favorite_film`
--
ALTER TABLE `favorite_film`
  ADD PRIMARY KEY (`userid`,`filmid`),
  ADD KEY `FK8hylol82cg6pd8ds2nk2rd6tn` (`filmid`);

--
-- A tábla indexei `favorite_genre`
--
ALTER TABLE `favorite_genre`
  ADD PRIMARY KEY (`userid`,`genreid`),
  ADD KEY `FK20roryphk0vdxnelry5mn0k8l` (`genreid`);

--
-- A tábla indexei `favorite_people`
--
ALTER TABLE `favorite_people`
  ADD PRIMARY KEY (`userid`,`peopleid`),
  ADD KEY `FK2ec9k9s0yrl2db998rd10ehq7` (`peopleid`);

--
-- A tábla indexei `filmrates`
--
ALTER TABLE `filmrates`
  ADD PRIMARY KEY (`film_rateid`);

--
-- A tábla indexei `films`
--
ALTER TABLE `films`
  ADD PRIMARY KEY (`filmid`);

--
-- A tábla indexei `film_genre`
--
ALTER TABLE `film_genre`
  ADD PRIMARY KEY (`filmid`,`genreid`),
  ADD KEY `FKjf15mjxr4lm1cd6yloy11ggj1` (`genreid`);

--
-- A tábla indexei `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`genreid`);

--
-- A tábla indexei `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`peopleid`);

--
-- A tábla indexei `profession`
--
ALTER TABLE `profession`
  ADD PRIMARY KEY (`peopleid`,`role_typeid`),
  ADD KEY `FK9m5ncvu99tghq7nxu7006ytgp` (`role_typeid`);

--
-- A tábla indexei `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`roleid`);

--
-- A tábla indexei `roletypes`
--
ALTER TABLE `roletypes`
  ADD PRIMARY KEY (`role_typeid`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `UK_33uo7vet9c79ydfuwg1w848f` (`user_email`);

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `favorite_film`
--
ALTER TABLE `favorite_film`
  ADD CONSTRAINT `FK43cnkm1olj28c1ow0vomfyi00` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `FK8hylol82cg6pd8ds2nk2rd6tn` FOREIGN KEY (`filmid`) REFERENCES `films` (`filmid`);

--
-- Megkötések a táblához `favorite_genre`
--
ALTER TABLE `favorite_genre`
  ADD CONSTRAINT `FK20roryphk0vdxnelry5mn0k8l` FOREIGN KEY (`genreid`) REFERENCES `genres` (`genreid`),
  ADD CONSTRAINT `FKs7crmoqilvnaqq8st150ajvmt` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`);

--
-- Megkötések a táblához `favorite_people`
--
ALTER TABLE `favorite_people`
  ADD CONSTRAINT `FK2ec9k9s0yrl2db998rd10ehq7` FOREIGN KEY (`peopleid`) REFERENCES `people` (`peopleid`),
  ADD CONSTRAINT `FKq9pgggubd63xoqmq06s0bnwod` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`);

--
-- Megkötések a táblához `film_genre`
--
ALTER TABLE `film_genre`
  ADD CONSTRAINT `FKfu1qr1g64n0hpgjjovjofb6u0` FOREIGN KEY (`filmid`) REFERENCES `films` (`filmid`),
  ADD CONSTRAINT `FKjf15mjxr4lm1cd6yloy11ggj1` FOREIGN KEY (`genreid`) REFERENCES `genres` (`genreid`);

--
-- Megkötések a táblához `profession`
--
ALTER TABLE `profession`
  ADD CONSTRAINT `FK9m5ncvu99tghq7nxu7006ytgp` FOREIGN KEY (`role_typeid`) REFERENCES `roletypes` (`role_typeid`),
  ADD CONSTRAINT `FKta97c64b1gedywqyon64ncgaf` FOREIGN KEY (`peopleid`) REFERENCES `people` (`peopleid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
