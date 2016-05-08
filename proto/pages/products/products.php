<?php
include_once('../../config/init.php');
include_once($BASE_DIR.'database/products.php');

if (isset($_GET['search']) && $_GET['search'] != '') {
    $products = searchProducts($_GET['search']);
}
else $products = getAllProducts();

$smarty->assign('products', $products);

$smarty->display('products/products.tpl');
?>
