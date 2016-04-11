DELETE FROM WishList;
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


INSERT INTO Product (code,name,price,stock,tags,weight,discount,discountEnd,featured) VALUES (10245,'Black&Decker X102',59.25,5,NULL,3,20,NULL,'yes');
INSERT INTO Product (code,name,price,stock,tags,weight,discount,discountEnd,featured) VALUES (10246,'Black&Decker Z150',80.50,2,NULL,2.30,20,NULL,'yes');
INSERT INTO Product (code,name,price,stock,tags,weight,discount,discountEnd,featured) VALUES (10140,'Optical Fiber OM3LC/LC 30m',25,10,NULL,0.20,5,NULL,'yes');
INSERT INTO Product (code,name,price,stock,tags,weight,discount,discountEnd,featured) VALUES (10176,'Cabo de Rede 3m',5,25,NULL,0.5,5,NULL,'no');
INSERT INTO Product (code,name,price,stock,tags,weight,discount,discountEnd,featured) VALUES (10123,'Maquina Bricks Fibra',250,1,NULL,6.3,5,NULL,'no');
INSERT INTO Product (code,name,price,stock,tags,weight,discount,discountEnd,featured) VALUES (30455,'Yeezy Boots',469.99,1,NULL,0.3,5,NULL,'yes');


INSERT INTO Person (name,password) VALUES ('Mariotti Mizuna','password');
INSERT INTO Person (name,password) VALUES ('Carlitos Nicolia','valdagno5');
INSERT INTO Person (name,password) VALUES ('Joao Almeida','grossoundergroundpvz');
INSERT INTO Person (name,password) VALUES ('Nuno Pinto','fcpallez');
INSERT INTO Person (name,password) VALUES ('Admin001','shopadmin001');

INSERT INTO Client (idPerson,address,email) VALUES (1,'Rua Carlos Paiao 145','marimizuna@gmail.com');
INSERT INTO Client (idPerson,address,email) VALUES (2,'Largo Sidonio Pais 27','nicolia@slb.com');
INSERT INTO Client (idPerson,address,email) VALUES (3,'Rua Aguca Minhota','johnygato@gmail.com');
INSERT INTO Client (idPerson,address,email) VALUES (4,'Avenida Brasil 702 3ESQ','up200100000@gmail.com');

INSERT INTO SystemAdministrator (idPerson) VALUES (5);

INSERT INTO Checkout (idCheckout,date,idPerson) VALUES (1,'2010-04-20',1);
INSERT INTO Checkout (idCheckout,date,idPerson) VALUES (2,'2010-04-20',3);

INSERT INTO Purchase (idProduct,idCheckout,price,quantity) VALUES (1,1,59.25,1);
INSERT INTO Purchase (idProduct,idCheckout,price,quantity) VALUES (3,2,50,2);

INSERT INTO Rate VALUES (1,1,'2010-04-21',5,NULL,NULL);

INSERT INTO WishList (idPerson,idProduct) VALUES (1,5);
INSERT INTO WishList (idPerson,idProduct) VALUES (4,6);

INSERT INTO Tags (name) VALUES ('cabos-fibras');

INSERT INTO TagsProducts (idTags,idProduct) VALUES (1,3);

INSERT INTO SupportTicket (createDate,reason,solveDate,title,idClient,idAdmin,idPurchase) VALUES ('2013-05-12','Wrong cable size','2013-05-14','Optical Fiber',3,5,3);
