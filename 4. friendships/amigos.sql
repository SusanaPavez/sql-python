SELECT users.first_name AS First_Name, users.last_name AS Last_Name,
user2.first_name AS Friend_Name, user2.last_name AS Friend_Last_Name
FROM users
JOIN friendships ON users.id = friendships.user_id
JOIN users AS user2 ON friendships.friend_id = user2.id;

-- Devuelva a todos los usuarios que son amigos de Kermit, asegúrese de que sus nombres se muestren en los resultados.

SELECT users.first_name AS First_Name, users.last_name AS Last_Name,
user2.first_name AS Friend_Name, user2.last_name AS Friend_Last_Name
FROM users
JOIN friendships ON users.id = friendships.user_id
JOIN users AS user2 ON friendships.friend_id = user2.id;
SELECT users.first_name WHERE users.first_name = "Kermit";


-- Devuelve el recuento de todas las amistades.
-- Descubre quién tiene más amigos y devuelve el recuento de sus amigos.
-- Crea un nuevo usuario y hazlos amigos de Eli Byers, Kermit The Frog y Marky Mark.
-- Devuelve a los amigos de Eli en orden alfabético.
-- Eliminar a Marky Mark de los amigos de Eli.
-- Devuelve todas las amistades, mostrando solo el nombre y apellido de ambos amigos

