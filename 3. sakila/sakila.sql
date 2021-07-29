-- 1. ¿Qué consulta ejecutarías para obtener todos los clientes dentro de city_id = 312? 
-- Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente.

SELECT city.city_id, customer.first_name AS Name, customer.last_name AS Last_Name, customer.email AS Email FROM customer
JOIN address ON customer.address_id= address.address_id
JOIN city ON address.city_id= city.city_id
WHERE city.city_id = 312;


-- 2. ¿Qué consulta harías para obtener todas las películas de comedia? 
-- Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, las características especiales y el género (categoría).

SELECT film.title AS Nombre_Pelicula, film.description AS Descripcion, film.release_year AS Año_Lanzamiento, film.rating AS Calificacion, film.special_features AS Caracteristicas_Especiales, category.name AS Categoria FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
WHERE category.name = "Comedy"; 
-- Cat Coneheads, Amazing Display y Freedom Cleopatra son las películas que necesitamos. Doom Dancing será el nombre de mi banda si tengo una


-- 3. ¿Qué consulta harías para obtener todas las películas unidas por actor_id = 5? 
-- Su consulta debe devolver la identificación del actor, el nombre del actor, el título de la película, la descripción y el año de lanzamiento.

SELECT actor.first_name AS Nombre, actor.last_name AS Apellido, film.title AS Pelicula, film.description AS Descripcion, film.release_year AS Año_Lanzamiento FROM film
JOIN film_actor ON film.film_id= film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE actor.actor_id = 5; -- El tipo hizo muchas películas en un año!


-- 4. ¿Qué consulta ejecutaría para obtener todos los clientes en store_id = 1 y dentro de estas ciudades (1, 42, 312 y 459)? 
-- Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente.

SELECT store.store_id AS ID_Tienda, city.city_id AS ID_Ciudad, CONCAT(customer.first_name, " ", customer.last_name ) AS Cliente,
customer.email AS Correo, address.address AS Direccion FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON city.city_id = address.city_id
JOIN store ON customer.store_id = store.store_id
WHERE store.store_id = "1" AND city.city_id IN ("1", "42", "312", "459");


-- 5. ¿Qué consulta realizarías para obtener todas las películas con una "calificación = G" y "característica especial = detrás de escena",
-- unidas por actor_id = 15? Su consulta debe devolver el título de la película, la descripción, el año de lanzamiento,
-- la calificación y la función especial. Sugerencia: puede usar la función LIKE para obtener la parte 'detrás de escena'.

SELECT film.title AS Pelicula, film.description AS Descripcion, film.release_year AS Año_Lanzamiento, film.rating AS Calificacion, film.special_features AS Caracteristicas_Especiales FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE film.rating = "G" AND film.special_features LIKE "%Behind the Scenes" AND actor.actor_id = 15;


-- 6. ¿Qué consulta harías para obtener todos los actores que se unieron en el film_id = 369? 
-- Su consulta debe devolver film_id, title, actor_id y actor_name.

SELECT film.title AS Pelicula, film.film_id AS ID_Pelicula, actor.actor_id AS Actores, CONCAT(actor.first_name," ", actor.last_name) AS Nombre FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE film_actor.film_id = "369"; 


-- 7. ¿Qué consulta harías para obtener todas las películas dramáticas con una tarifa de alquiler de 2.99?
-- Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación,
-- las características especiales y el género (categoría).

SELECT film.title AS Pelicula, film.description AS Descripcion, film.release_year AS Año_Lanzamento, 
film.rating AS Calificacion, film.special_features AS Caracteristicas_Especiales, 
category.name AS Categoria, film.rental_rate AS Precio_Arriendo FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
WHERE category.name = "Drama" AND film.rental_rate= 2.99;


-- 8. ¿Qué consulta harías para obtener todas las películas de acción a las que se une SANDRA KILMER?
-- Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación,
-- las características especiales, el género (categoría) y el nombre y apellido del actor.

SELECT actor.actor_id AS ID_Actor, film.title AS Pelicula, film.description AS Descripcion, film.release_year AS Año_Lanzamiento, film.rating AS Calificacion,
film.special_features AS Caraceristicas_Especiales, category.name AS Categoria, CONCAT(actor.first_name, " ", actor.last_name) AS Actor_Actriz FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
WHERE actor.first_name = "SANDRA" AND actor.last_name = "KILMER" AND category.name = "Action"; 

-- Bull Shawshank es una descripción bastante buena de la Canada rural