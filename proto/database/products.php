<?php
function getAllProducts() {
    global $conn;
    $stmt = $conn->prepare('SELECT * FROM Product ORDER BY name ASC');
    $stmt->execute();
    return $stmt->fetchAll();
}
?>
