CREATE OR REPLACE FUNCTION decStock() RETURNS TRIGGER AS $$
  BEGIN
    New.stock = old.stock - quantity;
  RETURN New.stock;
END;
$$
LANGUAGE plpgsql;s


DROP TRIGGER IF EXISTS decStockAfterPurchase ON Product;
CREATE TRIGGER decStockAfterPurchase
BEFORE INSERT ON Purchase
EXECUTE PROCEDURE decStock();
