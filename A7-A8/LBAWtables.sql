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
    price numeric NOT NULL CHECK(price > 0),
    stock integer NOT NULL CHECK(stock >= 0),
    weight numeric NOT NULL CHECK(weight > 0),
    discount numeric NOT NULL CHECK(discount > 0),
    discountEnd Date,
    featured boolean,
    description text DEFAULT 'No Description',

    PRIMARY KEY(idProduct)
);

CREATE TABLE Rate (
    idPerson integer NOT NULL REFERENCES Client(idPerson),
    idProduct integer NOT NULL REFERENCES Product(idProduct),
    date date NOT NULL,
    rating numeric NOT NULL CHECK(rating >= 0 AND rating <= 5),
    title text,
    description text,

    CONSTRAINT pk_Rate PRIMARY KEY(idPerson,idProduct)
);

CREATE TABLE ShoppingCart (
    idPerson integer NOT NULL REFERENCES Client(idPerson),
    idProduct integer NOT NULL REFERENCES Product(idProduct),
    quantity integer NOT NULL CHECK(quantity>0),

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

----- FTS
ALTER TABLE Product ADD COLUMN tsv tsvector;

CREATE OR REPLACE FUNCTION product_gen_tsvector() RETURNS TRIGGER AS $$
BEGIN
  NEW.tsv :=
          setweight(to_tsvector('english', COALESCE(NEW.code||'', '')), 'A') ||
          setweight(to_tsvector('english', COALESCE(NEW.name,'')), 'B') ||
          setweight(to_tsvector('english', COALESCE(NEW.description,'')), 'C');
  RETURN NEW;
END
$$ LANGUAGE plpgsql;

CREATE TRIGGER upsert_products_tsv
BEFORE INSERT OR UPDATE ON Product
FOR EACH ROW
EXECUTE PROCEDURE product_gen_tsvector();

CREATE INDEX product_tsv_idx ON Product USING gin(tsv);

-- Triggers

-- Trigger responsavel por verificar se adicionar ao ShoppingCart e possivel, comparando a quantidade desejada com o stock
CREATE OR REPLACE FUNCTION checkStock() RETURNS TRIGGER AS $$
BEGIN
  IF NEW.quantity > (SELECT stock FROM Product WHERE
  NEW.idProduct = idProduct) THEN
  RAISE EXCEPTION 'Nao e possivel adicionar ao ShoppingCart pois nao ha stock suficiente';
  END IF;
  RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER checkStock
BEFORE INSERT OR UPDATE ON ShoppingCart
FOR EACH ROW
EXECUTE PROCEDURE checkStock();

-- Trigger responsavel por decrementar o stock apos adicionar ao ShoppingCart
CREATE OR REPLACE FUNCTION decStock() RETURNS TRIGGER AS $$
BEGIN
  UPDATE Product
  SET stock = ((SELECT stock FROM Product WHERE
  NEW.idProduct = idProduct) - NEW.quantity)
  WHERE NEW.idProduct = idProduct;
  RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER decStock
AFTER INSERT ON ShoppingCart
FOR EACH ROW
EXECUTE PROCEDURE decStock();

-- So e possivel fazer uma compra caso o produto tiver no carrinho, se tiver a quantidade e é apagado
CREATE OR REPLACE FUNCTION purchaseIsPossible() RETURNS TRIGGER AS $$
BEGIN
  IF (NEW.idProduct IN (SELECT idProduct FROM ShoppingCart
  WHERE idPerson IN
  (SELECT idPerson FROM Checkout WHERE idCheckout=NEW.idCheckout))) AND
  (NEW.quantity = (SELECT quantity FROM ShoppingCart WHERE idPerson IN
  (SELECT idPerson FROM Checkout WHERE idCheckout=NEW.idCheckout) AND
idProduct = NEW.idProduct))
  THEN
  DELETE FROM ShoppingCart WHERE idProduct = NEW.idProduct AND
  idPerson=(SELECT idPerson FROM Checkout WHERE idCheckout=NEW.idCheckout);
  ELSE
  RAISE EXCEPTION 'purchase isnt possible';
  END IF;
  RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER purchaseIsPossiblel
BEFORE INSERT ON Purchase
FOR EACH ROW
EXECUTE PROCEDURE purchaseIsPossible();

-- Triggers que impossivel a criaçao de um client e um SystemAdministrator com o mesmo id
CREATE OR REPLACE FUNCTION checkIDAdmin() RETURNS TRIGGER AS $$
BEGIN
  IF NEW.idPerson = (SELECT idPerson FROM Client WHERE
  NEW.idPerson = idPerson) THEN
  RAISE EXCEPTION 'invalid id to SystemAdministrator';
  END IF;
  RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER checkIDAdmin
BEFORE INSERT OR UPDATE ON SystemAdministrator
FOR EACH ROW
EXECUTE PROCEDURE checkIDAdmin();

CREATE OR REPLACE FUNCTION checkIDClient() RETURNS TRIGGER AS $$
BEGIN
  IF NEW.idPerson = (SELECT idPerson FROM SystemAdministrator WHERE
  NEW.idPerson = idPerson) THEN
  RAISE EXCEPTION 'invalid id to Client';
  END IF;
  RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER checkIDClient
BEFORE INSERT OR UPDATE ON Client
FOR EACH ROW
EXECUTE PROCEDURE checkIDClient();
