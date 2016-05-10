<?php
function getAllProducts() {
    global $conn;
    $stmt = $conn->prepare('SELECT * FROM Product ORDER BY name ASC');
    $stmt->execute();
    return $stmt->fetchAll();
}

function searchProducts($query) {
    global $conn;
    // $stmt = $conn->prepare("SELECT * FROM Product WHERE to_tsvector('english', name) @@ to_tsquery('english', ?) ORDER BY name ASC");
    $stmt = $conn->prepare("SELECT * FROM Product WHERE to_tsvector('english', code || ' ' || name || ' ' || description) @@ to_tsquery('english', ?) ORDER BY name ASC");
    $stmt->execute(array($query));
    return $stmt->fetchAll();
}

function getProduct($id) {
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM Product WHERE idProduct=?");
    $stmt->execute(array($id));
    return $stmt->fetch();
}

function getProductReviews($id) {
    $final = array();

    global $conn;
    $stmt = $conn->prepare("SELECT Rate.*, Person.name FROM Rate JOIN Person using (idPerson) WHERE idProduct=?");
    $stmt->execute(array($id));
    $final["reviews"] = $stmt->fetchAll();

    $stmt = $conn->prepare("SELECT AVG(rating) FROM Rate WHERE idProduct=?");
    $stmt->execute(array($id));
    $final["avg"] = round($stmt->fetch()['avg'], 1);

    return $final;
}

?>
