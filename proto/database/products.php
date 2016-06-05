<?php

function getProductPrice($product) {
    if ($product.discountend != null && new DateTime("2018-05-15") > new DateTime()) {
        $dis_price = (float)$product['discount'] * (float)$product['price'];
        return (1 - (float)$product['discount']/100) * (float)$product['price'];
    } else return (float)$product['price'];
}

function getFeatured() {
    global $conn;
    $stmt = $conn->prepare('SELECT * FROM Product WHERE featured = TRUE ORDER BY RANDOM() LIMIT 3');
    $stmt->execute();
    return $stmt->fetchAll();
}

function getDiscounts() {
    global $conn;
    $stmt = $conn->prepare('SELECT * FROM Product WHere discountEnd > CURRENT_DATE ORDER BY discountEnd ASC LIMIT 3');
    $stmt->execute();
    return $stmt->fetchAll();
}

function getAllProducts() {
    global $conn;
    $stmt = $conn->prepare('SELECT P.*, COALESCE(AVG(rating), 0) as rating FROM Product P LEFT JOIN Rate R on P.idProduct = R.idProduct GROUP BY P.idProduct ORDER BY name ASC');
    $stmt->execute();
    return $stmt->fetchAll();
}

function searchProducts($query) {
    // Sanitize query
    $s_query = preg_replace('/\s+(?=([^"]*"[^"]*")*[^"]*$)/', '|', $query);
    $s_query = preg_replace('/"(.*?)"/', '($1)', $s_query);
    $s_query = preg_replace('/\s+/', '&', $s_query);

    global $conn;
    $stmt = $conn->prepare("SELECT P.*, COALESCE(AVG(rating), 0) AS Rating
FROM Product P LEFT JOIN Rate R ON R.idProduct = P.idProduct, to_tsquery(?) query
WHERE query @@ P.tsv
GROUP BY P.idProduct, query
ORDER BY ts_rank(P.tsv, query) DESC");
    $stmt->execute(array($s_query));

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
