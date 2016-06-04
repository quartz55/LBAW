
<?php
include_once('../../config/init.php');
include_once($BASE_DIR.'database/shoppingcart.php');

if (!isset($_SESSION['useremail'])) {
    $_SESSION['error_msgs'][] = "Unauthorized access";
    header("Location: " . $BASE_URL);
    exit;
}

$user = getClient($_SESSION['useremail'])['idperson'];
$products = getShoppingCartProducts($user);

$smarty->assign('products', $products);

$smarty->display('users/shoppingcart.tpl');
?>