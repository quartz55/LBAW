<?php
include_once('../../config/init.php');
include_once($BASE_DIR. 'database/products.php');

if (!isset($_SESSION['adminname'])) {
    $_SESSION['error_msgs'][] = "Unauthorized access";
    header("Location: " . $BASE_URL);
    exit;
}

$products = getAllProducts();

$smarty->assign('products', $products);
$smarty->display('admin/products.tpl');
?>