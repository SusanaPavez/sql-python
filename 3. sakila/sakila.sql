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

-- 3. ¿Qué consulta harías para obtener todas las películas unidas por actor_id = 5? 
-- Su consulta debe devolver la identificación del actor, el nombre del actor, el título de la película, la descripción y el año de lanzamiento.

SELECT actor.first_name AS Nombre, actor.last_name AS Apellido, film.title AS Pelicula, film.description AS Descripcion, film.release_year AS Año_Lanzamiento FROM film
JOIN film_actor ON film.film_id= film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE actor.actor_id = 5; -- El tipo hizo muchas películas en un año!


-- 4. ¿Qué consulta ejecutaría para obtener todos los clientes en store_id = 1 y dentro de estas ciudades (1, 42, 312 y 459)? 
-- Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente.

SELECT store.store_id AS ID_Tienda, city.city_id AS ID_Ciudad, customer.first_name AS Nombre, customer.last_name AS Apellido, customer.email AS Correo, CONCAT(customer.address," ", customer.address2) AS Direccion FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON city.city_id = address.city_id
JOIN store ON customer.store_id = store.store_id
WHERE store.store_id = 1 AND (city.city_id = 1 OR city.city_id =42 OR city.city_id = 312 
OR city.city_id = 459);

-- 5. ¿Qué consulta realizarías para obtener todas las películas con una "calificación = G" y "característica especial = detrás de escena",
-- unidas por actor_id = 15? Su consulta debe devolver el título de la película, la descripción, el año de lanzamiento,
-- la calificación y la función especial. Sugerencia: puede usar la función LIKE para obtener la parte 'detrás de escena'.

-- 6. ¿Qué consulta harías para obtener todos los actores que se unieron en el film_id = 369? 
-- Su consulta debe devolver film_id, title, actor_id y actor_name.

-- 7. ¿Qué consulta harías para obtener todas las películas dramáticas con una tarifa de alquiler de 2.99?
-- Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación,
-- las características especiales y el género (categoría).

-- 8. ¿Qué consulta harías para obtener todas las películas de acción a las que se une SANDRA KILMER?
-- Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación,
-- las características especiales, el género (categoría) y el nombre y apellido del actor.