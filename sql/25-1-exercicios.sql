-- 1) Insira 5 usuários
INSERT
INTO users (first_name,last_name,email,password_hash)
VALUES 
("Brittany","Strings","nibh.sit@nunc.edu.br","ROM35HMM4SAJKSD"),
("Ferris","Herris","neque.Morbi@porttitorscelerisqueneque.edu.br","YTU15GQR9HTJKSD"),
("Jacob","Manninson","risus.at@sociis.edu.br","EQS93HLI6QZJKSD"),
("Keelie","Peters","Nulla@lobortis.net","ZHE87TSO6DAJKSD"),
("Benjamin","Dannis","nec@dolor.net","CNW39GMH4NZJKSD");

-- 2) Insira 5 perfís para os usuários inseridos
INSERT
INTO profiles (bio, description, user_id)
SELECT concat('Bio de ', first_name), concat('Description de', ' ', first_name), id 
FROM users
WHERE users.id BETWEEN 104 AND 108;
 
-- 3) Insira permissões (roles) para os usuários inseridos
INSERT
INTO users_roles (users_id, roles_id)
SELECT id, (SELECT id FROM roles ORDER BY rand() LIMIT 1) AS qualquer 
FROM users;
WHERE users.id BETWEEN 104 AND 108;

-- 4) Selecione os últimos 5 usuários por ordem decrescente
SELECT *
FROM users
ORDER BY id DESC
LIMIT 5;

-- 5) Atualize o último usuário inserido
UPDATE users
SET email = 'nec@dolor.net.br'
WHERE id = LAST_INSERT_ID();

-- 6) Remova uma permissão de algum usuário
DELETE
FROM users_roles
WHERE users_id = 88 AND roles_id = 3;

-- 7) Remova um usuário que tem a permissão "PUT"
DELETE
FROM users AS u
INNER JOIN users_roles ur
ON ur.users_id = u.id
WHERE u.id = 8 AND ur.roles_id = 2; 

-- 8) Selecione usuários com perfís e permissões (obrigatório)
SELECT 
	u.id AS uid, CONCAT(u.first_name, ' ', u.last_name) AS uname , 
	p.id AS pid, p.description AS pdescription, 
	r.id AS rid, r.name AS rname
FROM users u 
INNER JOIN profiles p 
ON p.user_id = u.id 
INNER JOIN users_roles ur 
ON ur.user_id = u.id 
INNER JOIN roles r 
ON r.id = ur.role_id
ORDER BY u.id;

-- 9) Selecione usuários com perfís e permissões (opcional)
SELECT 
	u.id AS uid, CONCAT(u.first_name, ' ', u.last_name) AS uname , 
	p.id AS pid, p.description AS pdescription, 
	r.id AS rid, r.name AS rname
FROM users u 
LEFT JOIN profiles p 
ON p.user_id = u.id 
LEFT JOIN users_roles ur 
ON ur.user_id = u.id 
LEFT JOIN roles r 
ON r.id = ur.role_id
ORDER BY u.id;

-- 10) Selecione usuários com perfís e permissões ordenando por salário
SELECT 
	u.id AS uid, CONCAT(u.first_name, ' ', u.last_name) AS uname, u.salary AS usalary, 
	p.id AS pid, p.description AS pdescription, 
	r.id AS rid, r.name AS rname
FROM users u 
INNER JOIN profiles p 
ON p.user_id = u.id 
INNER JOIN users_roles ur 
ON ur.user_id = u.id 
INNER JOIN roles r 
ON r.id = ur.role_id
ORDER BY u.salary;
