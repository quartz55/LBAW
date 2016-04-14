DROP TABLE IF EXISTS Product CASCADE;
DROP TABLE IF EXISTS Checkout CASCADE;
DROP TABLE IF EXISTS Purchase CASCADE;
DROP TABLE IF EXISTS SupportTicket CASCADE;
DROP TABLE IF EXISTS Client CASCADE;
DROP TABLE IF EXISTS SystemAdministrator CASCADE;
DROP TABLE IF EXISTS Person CASCADE;
DROP TABLE IF EXISTS WishList CASCADE;
DROP TABLE IF EXISTS Tags CASCADE;
DROP TABLE IF EXISTS TagsProducts CASCADE;
DROP TABLE IF EXISTS Rate CASCADE;
DROP TABLE IF EXISTS ShoppingCart CASCADE;

CREATE TABLE Person (
    idPerson SERIAL NOT NULL,
    name text NOT NULL,
    password text NOT NULL CHECK(LENGTH(password) > 6),

    PRIMARY KEY(idPerson)
);

CREATE TABLE SystemAdministrator (
    idPerson integer NOT NULL REFERENCES Person(idPerson),

    PRIMARY KEY(idPerson)
);

CREATE TABLE Client (
    idPerson integer NOT NULL REFERENCES Person(idPerson),
    address text NOT NULL,
    email text UNIQUE NOT NULL,

    PRIMARY KEY(idPerson)
);

CREATE TABLE Product (
    idProduct SERIAL NOT NULL,
    code integer UNIQUE NOT NULL,
    name text UNIQUE NOT NULL,
    price numeric CHECK(price > 0),
    stock integer CHECK(stock > 0),
    tags integer ARRAY,
    weight numeric CHECK(weight > 0),
    discount numeric CHECK(discount > 0),
    discountEnd Date,
    featured boolean,

    PRIMARY KEY(idProduct)
);

CREATE TABLE Rate (
    idPerson integer NOT NULL REFERENCES Client(idPerson),
    idProduct integer NOT NULL REFERENCES Product(idProduct),
    date date NOT NULL,
    rating numeric CHECK(rating >= 0 AND rating <= 5),
    title text,
    description text,

    CONSTRAINT pk_Rate PRIMARY KEY(idPerson,idProduct)
);

CREATE TABLE ShoppingCart (
    idPerson integer NOT NULL REFERENCES Client(idPerson),
    idProduct integer NOT NULL REFERENCES Product(idProduct),

    CONSTRAINT pk_ShoppingCart PRIMARY KEY(idPerson,idProduct)
);

CREATE TABLE Checkout (
    idCheckout SERIAL NOT NULL,
    date Date NOT NULL,
    idPerson integer NOT NULL,
    CONSTRAINT fk_Client FOREIGN KEY(idPerson) REFERENCES Client(idPerson),

    PRIMARY KEY(idCheckout)
);

CREATE TABLE Purchase (
    idProduct integer NOT NULL REFERENCES Product(idProduct),
    idCheckout integer NOT NULL REFERENCES Checkout(idCheckout),
    price numeric NOT NULL CHECK(price > 0),
    quantity integer CHECK (quantity > 0),

    CONSTRAINT pk_Purchase PRIMARY KEY(idProduct,idCheckout)
);

CREATE TABLE SupportTicket (
    idSupportTicket SERIAL NOT NULL,
    createDate date NOT NULL,
    reason text NOT NULL,
    solveDate date CHECK(solveDate > createDate),
    title text NOT NULL,
    idClient integer NOT NULL,
    idAdmin integer NOT NULL,
    idProduct integer NOT NULL,
    idCheckout integer NOT NULL,
    CONSTRAINT fk_Client FOREIGN KEY(idClient) REFERENCES Client(idPerson),
    CONSTRAINT fk_SystemAdmnistrator FOREIGN KEY(idAdmin) REFERENCES SystemAdministrator(idPerson),
    CONSTRAINT fk_Purchase FOREIGN KEY(idProduct,idCheckout) REFERENCES Purchase(idProduct,idCheckout),

    PRIMARY KEY(idSupportTicket)
);

CREATE TABLE WishList (
    idPerson integer NOT NULL REFERENCES Client(idPerson),
    idProduct integer NOT NULL REFERENCES Product(idProduct),

    CONSTRAINT pk_WishList PRIMARY KEY(idPerson,idProduct)
);

CREATE TABLE Tags (
    idTags SERIAL NOT NULL,
    name text NOT NULL,

    PRIMARY KEY(idTags)
);

CREATE TABLE TagsProducts (
    idTags integer NOT NULL REFERENCES Tags(idTags),
    idProduct integer NOT NULL REFERENCES Product(idProduct),

    CONSTRAINT pk_TagsProducts PRIMARY KEY(idTags,idProduct)
);

-- Indexes

CREATE INDEX email
ON Client USING btree(email);

-- Triggers
/*
CREATE OR REPLACE FUNCTION decStock() RETURNS TRIGGER AS $$
BEGIN
  IF NEW.price = '469.99' THEN
    RAISE EXCEPTION 'quero cona pf';
  END IF;
  RETURN NULL;
END;
$$
LANGUAGE plpgsql;


CREATE TRIGGER decStockAfterPurchase
AFTER INSERT ON Product
FOR EACH ROW
EXECUTE PROCEDURE decStock();
*/
/*
CREATE OR REPLACE FUNCTION decStock() RETURNS TRIGGER AS $$
BEGIN
  NEW.stock = old.stock - old.quantity;
  IF NEW.stock IS NULL THEN
    RAISE EXCEPTION "Product not available";
  END IF;
  RETURN NULL;
END;
$$
LANGUAGE plpgsql;


CREATE TRIGGER decStockAfterPurchase
BEFORE INSERT ON Product,Purchase
FOR EACH ROW
EXECUTE PROCEDURE decStock();
*/
