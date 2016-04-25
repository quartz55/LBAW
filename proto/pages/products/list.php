<?php
include_once('../../config/init.php');
include_once($BASE_DIR.'database/products.php');

$products = getAllProducts();
$smarty->assign('products', $products);

$smarty->display('products/list.tpl');

?>
