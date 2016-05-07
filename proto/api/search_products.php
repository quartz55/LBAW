<?php
include_once(__DIR__.'/../config/init.php');
include_once(__DIR__.'/../database/products.php');

if (isset($_POST['query']) && !empty($_POST['query'])) {
    $data = searchProducts($_POST['query']);
}
else $data = getAllProducts();

header('Content-Type: application/json');
echo json_encode($data);
?>
