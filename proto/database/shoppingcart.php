<?php

function getShoppingCartProducts($user) {
    global $conn;
    $stmt = $conn->prepare('SELECT * FROM ShoppingCart JOIN Product USING (idProduct) WHERE idPerson=?');
    $stmt->execute(array($user));
    return $stmt->fetchAll();
}

function addToShoppingCart($user, $product, $quantity) {
    global $conn;
    $stmt = $conn->prepare('INSERT INTO ShoppingCart VALUES (?,?,?)');
    $stmt->execute(array($user,$product,$quantity));
    return $stmt->fetch();
}

function removeFromShoppingCart($user, $product) {
    global $conn;
    $stmt = $conn->prepare('DELETE FROM ShoppingCart WHERE idperson=? AND idproduct = ?');
    $stmt->execute(array($user,$product));
    return $stmt->fetch();
}

function getCartProduct($user, $product) {
    global $conn;
    $stmt = $conn->prepare('SELECT Product.*, quantity FROM ShoppingCart JOIN Product using (idProduct) WHERE idPerson=? AND idProduct=?');
    $stmt->execute(array($user, $product));
    return $stmt->fetch();
}

function updateCartQuantity($user, $product, $new_quantity) {
    global $conn;
    $stmt = $conn->prepare('UPDATE ShoppingCart SET quantity=? WHERE idPerson=? AND idProduct=?');
    $stmt->execute(array($new_quantity, $user, $product));
    return $stmt->fetch();
}
?>