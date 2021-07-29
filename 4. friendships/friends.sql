-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: friends
-- ------------------------------------------------------
-- Server version	5.7.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `friendships`
--

DROP TABLE IF EXISTS `friendships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friendships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `friend_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  KEY `friend_id_idx` (`friend_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendships`
--

LOCK TABLES `friendships` WRITE;
/*!40000 ALTER TABLE `friendships` DISABLE KEYS */;
INSERT INTO `friendships` VALUES (1,1,2,'2019-02-08 11:13:27',NULL),(2,1,3,'2019-02-08 11:14:03',NULL),(3,1,4,'2019-02-08 11:14:38',NULL),(4,2,4,'2019-02-08 11:15:11',NULL),(5,2,5,'2019-02-08 11:15:23',NULL),(6,5,3,'2019-02-08 11:16:02',NULL);
/*!40000 ALTER TABLE `friendships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Amy','Giver','2019-02-08 11:12:11',NULL),(2,'Eli','Byers','2019-02-08 11:12:11',NULL),(3,'Big','Bird','2019-02-08 11:12:11',NULL),(4,'Kermit','The Frog','2019-02-08 11:12:11',NULL),(5,'Marky','Mark','2019-02-08 11:12:11',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-08 11:20:17


SELECT users.first_name AS First_Name, users.last_name AS Last_Name,
user2.first_name AS Friend_Name, user2.last_name AS Friend_Last_Name
FROM users
JOIN friendships ON users.id = friendships.user_id
JOIN users AS user2 ON friendships.friend_id = user2.id;

-- Devuelva a todos los usuarios que son amigos de Kermit, asegúrese de que sus nombres se muestren en los resultados.

SELECT users.first_name AS Nombre, users.last_name AS Apellido FROM users 
JOIN friendships ON users.id = friendships.user_id
JOIN users as friend ON friend.id = friendships.friend_id
WHERE friend.first_name = "Kermit";


-- Devuelve el recuento de todas las amistades.

SELECT users.first_name AS Nombre, users.last_name AS Apellido, COUNT(friend.id) AS Amigos FROM users
LEFT JOIN friendships ON users.id = friendships.user_id
LEFT JOIN users AS friend ON friendships.friend_id = friend.id
GROUP BY users.id;



-- Descubre quién tiene más amigos y devuelve el recuento de sus amigos

SELECT users.first_name AS Nombre, users.last_name AS Apellido, COUNT(friend.id) AS Amigos FROM users
LEFT JOIN friendships ON users.id = friendships.user_id
LEFT JOIN users AS friend ON friendships.friend_id = friend.id
GROUP BY users.id 
ORDER BY COUNT(friend.id) DESC; -- No me convence esta solución porque pienso que es sólo escoger un solo valor pero MySQL no permite usar comandos dentro de comandos


-- Crea un nuevo usuario y hazlos amigos de Eli Byers, Kermit The Frog y Marky Mark.

SELECT * FROM friendships; 
SELECT * FROM users; -- Aquí tengo los ID de los futuros amigos

INSERT INTO users (first_name, last_name, created_at, updated_at)
VALUES ('Mr.', 'Hopper', NOW(), NOW());
INSERT INTO friendships (user_id, friend_id, created_at, updated_at)
VALUES (6, 2, NOW(), NOW()); -- Id del Monstruo Comegalletas, Id de Eli, Creado, Actualizado
INSERT INTO friendships (user_id, friend_id, created_at, updated_at)
VALUES (6, 4, NOW(), NOW()); -- Id del Monstruo Comegalletas, Id de René, Creado, Actualizado
INSERT INTO friendships (user_id, friend_id, created_at, updated_at)
VALUES (6, 5, NOW(), NOW()); -- Id del Monstruo Comegalletas, Id de Marky Mark, Creado, Actualizado


-- Devuelve a los amigos de Eli en orden alfabético.

SELECT CONCAT_WS(" ", users.first_name, users.last_name) AS 'Nombre', 
CONCAT_WS(" ", friend.first_name, friend.last_name) AS "Amigo" FROM users
JOIN friendships ON users.id = friendships.user_id
JOIN users AS friend ON friendships.friend_id = friend.id
WHERE users.id = 2 
ORDER BY friend.first_name ASC;


-- Eliminar a Marky Mark de los amigos de Eli.

DELETE FROM friendships
WHERE user_id = 2 AND friend_id = 5; -- 2 es Eli, 5 es Marky Mark, ahora son enemigos


-- Devuelve todas las amistades, mostrando solo el nombre y apellido de ambos amigos

SELECT CONCAT(users.first_name," ", users.last_name) AS Usuario, 
CONCAT(friend.first_name," ", friend.last_name) AS Amigo FROM users
JOIN friendships ON users.id = friendships.user_id
JOIN users AS friend ON friendships.friend_id = friend.id;

-- Me encanta Plaza Sésamo! Con él fui niña y aprendí a ser mamá (https://www.youtube.com/watch?v=5BDVvB7Xx1w). 
-- También con Crush, de Buscando a Nemo (Este trozo me enseñó más sobre maternidad que cualquier libro de
-- maternidad en el mundo :https://www.youtube.com/watch?v=A3Fxx9o2Nvs)