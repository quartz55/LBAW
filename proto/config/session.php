<?php
$smarty->registerPlugin("modifier", "discount_price", "discountPrice");

$smarty->assign('BASE_URL', $BASE_URL);
$smarty->assign('USERNAME', $_SESSION['username']);
$smarty->assign('ERROR_MSGS', $_SESSION['error_msgs']);
$smarty->assign('SUCCESS_MSGS', $_SESSION['succ_msgs']);

if (isset($_SESSION['useremail'])) {
include_once($BASE_DIR . 'database/users.php');
include_once($BASE_DIR . 'database/shoppingcart.php');
$user = getClient($_SESSION['useremail'])['idperson'];
$smarty->assign('CART_ITEMS', count(getShoppingCartProducts($user)));
}

unset($_SESSION['error_msgs']);
unset($_SESSION['succ_msgs']);

function discountPrice($price, $discount) {
    return (1 - (float)$discount/100) * (float)$price;
}
?>
