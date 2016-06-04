<?php
include_once('../../config/init.php');
include_once($BASE_DIR.'database/products.php');

if (!isset($_GET['id'])) {
    $_SESSION['error_msgs'][] = "Invalid access";
    header("Location: ".$_SERVER['HTTP_REFERER']);
    exit;
}

$product = getProduct($_GET['id']);
if (empty($product)) {
    $_SESSION['error_msgs'][] = "Product doesn't exist";
    header("Location: ".$_SERVER['HTTP_REFERER']);
    exit;
}

$reviews = getProductReviews($_GET['id']);


$smarty->assign('product', $product);
$smarty->assign('reviews', $reviews['reviews']);
$smarty->assign('reviews_count', count($reviews['reviews']));
$smarty->assign('reviews_avg', $reviews['avg']);

$smarty->display('products/product.tpl');
?>
