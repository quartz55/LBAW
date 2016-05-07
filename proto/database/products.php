<?php
function getAllProducts() {
    global $conn;
    $stmt = $conn->prepare('SELECT * FROM Product ORDER BY name ASC');
    $stmt->execute();
    return $stmt->fetchAll();
}

function searchProducts($query) {
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM Product WHERE to_tsvector('english', name) @@ to_tsquery('english', ?) ORDER BY name ASC");
    $stmt->execute(array($query));
    return $stmt->fetchAll();
}
?>
