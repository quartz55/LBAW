<?php
include_once('../config/init.php');
include_once($BASE_DIR . 'database/users.php');
include_once($BASE_DIR . 'database/shoppingcart.php');

if (!isset($_SESSION['useremail'])) {
    $_SESSION['error_msgs'][] = 'Unauthorized access';
    header("Location: ".$_SERVER['HTTP_REFERER']);
    exit;
}

$user = getClient($_SESSION['useremail'])['idperson'];

clearShoppingCart($user);

header("Location: ".$_SERVER['HTTP_REFERER']);
?>