<?php

function checkout($user) {
    global $conn;

    $stmt = $conn->prepare("SELECT quantity, Product.* FROM ShoppingCart JOIN Product using (idproduct) WHERE idPerson = ?");
    $stmt->execute(array($user));
    $products = $stmt->fetchAll();

    $conn->beginTransaction();
    try {
        $stmt = $conn->prepare("INSERT INTO Checkout (date, idperson) VALUES (NOW(), ?)");
        $stmt->execute(array($user));
        $id = $conn->lastInsertId('checkout_idcheckout_seq');

        foreach($products as $p) {
            if ($p['discountend'] &&
                strtotime($p['discountend']) > time())
                $price (1-(float)$p['discount']/100)*(float)$p['price'];
            else $price = (float)$p['price'];

            $stmt = $conn->prepare("INSERT INTO Purchase VALUES (?, ?, ?, ?)");
            $stmt->execute(array($p['idproduct'], $id, $price,$p['quantity']));
        }

        $conn->commit();
    } catch (PDOException $e) {
        $conn->rollBack();
        throw $e;
    }
}

function getRecentPurchases($user) {
    global $conn;
    $stmt = $conn->prepare("SELECT Product.*, date, Purchase.price as rprice FROM checkout JOIN purchase USING (idcheckout) JOIN product using (idproduct) WHERE idperson = ? ORDER BY date DESC LIMIT 3");
    $stmt->execute(array($user));
    return $stmt->fetchAll();
}

function getPurchaseHistory($user) {
    global $conn;
    $stmt = $conn->prepare("SELECT Product.*, date, quantity, Purchase.price as rprice FROM checkout JOIN purchase USING (idcheckout) JOIN product using (idproduct) WHERE idperson = ? ORDER BY date DESC");
    $stmt->execute(array($user));
    return $stmt->fetchAll();
}

?>