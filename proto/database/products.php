<?php
function getAllProducts() {
    global $conn;
    $stmt = $conn->prepare('SELECT P.*, COALESCE(AVG(rating), 0) as rating FROM Product P LEFT JOIN Rate R on P.idProduct = R.idProduct GROUP BY P.idProduct ORDER BY name ASC');
    $stmt->execute();
    return $stmt->fetchAll();
}

function searchProducts($query) {
    global $conn;
    $stmt = $conn->prepare("SELECT p.*, coalesce(avg(rating),0) as rating FROM Product p LEFT JOIN Rate r on p.idproduct = r.idproduct WHERE to_tsvector('english', p.code || ' ' || p.name || ' ' || p.description) @@ to_tsquery('english', ?) GROUP BY p.idproduct ORDER BY p.name ASC");
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
