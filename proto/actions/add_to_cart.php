<?php
include_once('../config/init.php');
include_once($BASE_DIR . 'database/users.php');
include_once($BASE_DIR . 'database/shoppingcart.php');

if (!isset($_POST['id']) ||
    !isset($_POST['quantity'])){
    $_SESSION['error_msgs'][] = 'Invalid operation';
    header("Location: ".$_SERVER['HTTP_REFERER']);
    exit;
}
if (!isset($_SESSION['useremail'])) {
    $_SESSION['error_msgs'][] = 'Please login to add to cart';
    header("Location: ".$_SERVER['HTTP_REFERER']);
    exit;
}

$product = $_POST['id'];
$user = getClient($_SESSION['useremail'])['idperson'];
$quantity = $_POST['quantity'];

$exists = getCartProduct($user, $product);
if (!empty($exists)) {
    $new_quantity = $quantity + $exists['quantity'];
    try {
        updateCartQuantity($user, $product, $new_quantity);
    }
    catch (PDOException $e) {
        $_SESSION['error_msgs'][] = $e->getMessage();
    }
} else {
    try {
        addToShoppingCart($user, $product, $quantity);
    }
    catch (PDOException $e) {
        $_SESSION['error_msgs'][] = $e->getMessage();
    }
}

header("Location: ".$_SERVER['HTTP_REFERER']);
?>