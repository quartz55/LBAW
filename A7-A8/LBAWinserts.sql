TRUNCATE WishList CASCADE;
TRUNCATE Product CASCADE;
TRUNCATE Checkout CASCADE;
TRUNCATE Purchase CASCADE;
TRUNCATE SupportTicket CASCADE;
TRUNCATE Client CASCADE;
TRUNCATE SystemAdministrator CASCADE;
TRUNCATE Person CASCADE;
TRUNCATE Tags CASCADE;
TRUNCATE TagsProducts CASCADE;
TRUNCATE Rate CASCADE;
TRUNCATE ShoppingCart CASCADE;


INSERT INTO Product (code,name,price,stock,tags,weight,discount,discountEnd,featured) VALUES (10245,'Black&Decker X102',59.25,20,NULL,3,20,NULL,'yes');
INSERT INTO Product (code,name,price,stock,tags,weight,discount,discountEnd,featured) VALUES (10246,'Black&Decker Z150',80.50,25,NULL,2.30,20,NULL,'yes');
INSERT INTO Product (code,name,price,stock,tags,weight,discount,discountEnd,featured) VALUES (10140,'Optical Fiber OM3LC/LC 30m',25,10,NULL,0.20,5,NULL,'yes');
INSERT INTO Product (code,name,price,stock,tags,weight,discount,discountEnd,featured) VALUES (10176,'Cabo de Rede 3m',5,25,NULL,0.5,5,NULL,'no');
INSERT INTO Product (code,name,price,stock,tags,weight,discount,discountEnd,featured) VALUES (10123,'Maquina Bricks Fibra',250,12,NULL,6.3,5,NULL,'no');
INSERT INTO Product (code,name,price,stock,tags,weight,discount,discountEnd,featured) VALUES (30455,'Yeezy Boots',469.99,19,NULL,0.3,5,NULL,'yes');

INSERT INTO Person (name,password) VALUES ('Mariotti Mizuna','password');
INSERT INTO Person (name,password) VALUES ('Carlitos Nicolia','valdagno5');
INSERT INTO Person (name,password) VALUES ('Joao Almeida','grossoundergroundpvz');
INSERT INTO Person (name,password) VALUES ('Nuno Pinto','fcpallez');
INSERT INTO Person (name,password) VALUES ('Admin001','shopadmin001');
INSERT INTO Person (name,password) VALUES ('Joao Costa','1234567');
INSERT INTO Person (name,password) VALUES ('Antonio Fonseca','lkashdfrgdgfd');
INSERT INTO Person (name,password) VALUES ('Joana Tomé','joaninhaFCP');
INSERT INTO Person (name,password) VALUES ('Tony Madeira','to1234ny');

INSERT INTO Client (idPerson,address,email) VALUES (1,'Rua Carlos Paiao 145','marimizuna@gmail.com');
INSERT INTO Client (idPerson,address,email) VALUES (2,'Largo Sidonio Pais 27','nicolia@slb.com');
INSERT INTO Client (idPerson,address,email) VALUES (3,'Rua Aguca Minhota','johnygato@gmail.com');
INSERT INTO Client (idPerson,address,email) VALUES (4,'Avenida Brasil 702 3ESQ','up200100000@gmail.com');
INSERT INTO Client (idPerson,address,email) VALUES (6,'Travessa da Aldeia','quartz@gmail.com');
INSERT INTO Client (idPerson,address,email) VALUES (7,'Rua das mimosas','at2101@gmail.com');
INSERT INTO Client (idPerson,address,email) VALUES (8,'Avenida Mousinho','joana23@hotmail.com');
INSERT INTO Client (idPerson,address,email) VALUES (9,'Rua S.Joao','tonyM@hotmail.com');

INSERT INTO SystemAdministrator (idPerson) VALUES (5);

INSERT INTO Checkout (idCheckout,date,idPerson) VALUES (1,'2010-04-20',1);
INSERT INTO Checkout (idCheckout,date,idPerson) VALUES (2,'2010-04-20',3);
INSERT INTO Checkout (idCheckout,date,idPerson) VALUES (3,'2015-07-20',6);
INSERT INTO Checkout (idCheckout,date,idPerson) VALUES (4,'2013-07-23',8);

INSERT INTO Purchase (idProduct,idCheckout,price,quantity) VALUES (1,1,59.25,1);
INSERT INTO Purchase (idProduct,idCheckout,price,quantity) VALUES (3,2,50,2);
INSERT INTO Purchase (idProduct,idCheckout,price,quantity) VALUES (4,3,70,4);
INSERT INTO Purchase (idProduct,idCheckout,price,quantity) VALUES (2,4,40,1);

INSERT INTO ShoppingCart (idPerson,idProduct) VALUES (1,1);
INSERT INTO ShoppingCart (idPerson,idProduct) VALUES (3,3);
INSERT INTO ShoppingCart (idPerson,idProduct) VALUES (6,4);
INSERT INTO ShoppingCart (idPerson,idProduct) VALUES (8,2);

INSERT INTO Rate (idPerson,idProduct,date,rating,title,description) VALUES (1,1,'2010-04-21',5,NULL,NULL);
INSERT INTO Rate (idPerson,idProduct,date,rating,title,description) VALUES (6,4,'2015-07-30',4.5,NULL,'Produto Maravilhoso, entrega rápida e de qualidade');
INSERT INTO Rate (idPerson,idProduct,date,rating,title,description) VALUES (8,2,'2013-08-2',4.5,NULL,'Simplesmente perfeito');

INSERT INTO WishList (idPerson,idProduct) VALUES (1,5);
INSERT INTO WishList (idPerson,idProduct) VALUES (4,6);
INSERT INTO WishList (idPerson,idProduct) VALUES (4,2);
INSERT INTO WishList (idPerson,idProduct) VALUES (6,1);

INSERT INTO Tags (name) VALUES ('cabos-fibras');

INSERT INTO TagsProducts (idTags,idProduct) VALUES (1,3);

INSERT INTO SupportTicket (createDate,reason,solveDate,title,idClient,idAdmin,idPurchase) VALUES ('2013-05-12','Wrong cable size','2013-05-14','Optical Fiber',3,5,3);
