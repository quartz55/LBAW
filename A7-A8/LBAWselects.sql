-- Numero de Clientes
SELECT NULL AS "Numero de clientes";

SELECT COUNT(*) FROM Person
WHERE idPerson IN (SELECT idPerson FROM
(SELECT * FROM Client) AS clients);

-- Numero de Admins
SELECT NULL AS "Numero de admins";

SELECT COUNT(*) FROM Person
WHERE idPerson IN (SELECT idPerson FROM
(SELECT * FROM SystemAdministrator) AS admins);

-- Numero de produtos em stock mais caros que 150€ e com maior peso do que 5kg
SELECT NULL AS "N prods 150â‚¬+ e com maior peso do que 5kg";

SELECT COUNT(*) FROM Product
WHERE price>150 AND weight>5 AND stock>0;

-- Nome dos clientes que tenham o produto Yeezy Boots na sua wishlist
SELECT NULL AS "Nome dos clientes c/ Yeezy Boots na wishlist";

SELECT name FROM Person
WHERE idPerson IN (SELECT idPerson FROM
(SELECT * FROM Client) AS clients) AND idPerson IN (SELECT idPerson FROM
(SELECT * FROM WishList WHERE idProduct=6) AS prod6);
