<?php
include_once('../../config/init.php');
include_once($BASE_DIR.'database/products.php');
include_once($BASE_DIR.'database/purchases.php');

if (!isset($_SESSION['useremail'])) {
    $_SESSION['error_msgs'][] = "Unauthorized access";
    header("Location: " . $BASE_URL);
    exit;
}

$client = getClient($_SESSION['useremail'])['idperson'];

$smarty->assign('purchases', getPurchaseHistory($client));

$smarty->display('users/history.tpl');
?>
