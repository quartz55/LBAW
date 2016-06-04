
<?php
include_once('../config/init.php');
include_once($BASE_DIR . 'database/users.php');
include_once($BASE_DIR . 'database/shoppingcart.php');

if (!isset($_GET['id'])){
    $_SESSION['error_msgs'][] = 'Invalid operation';
    header("Location: ".$_SERVER['HTTP_REFERER']);
    exit;
}
if (!isset($_SESSION['useremail'])) {
    $_SESSION['error_msgs'][] = 'Unauthorized access';
    header("Location: ".$_SERVER['HTTP_REFERER']);
    exit;
}

$product = $_GET['id'];
$user = getClient($_SESSION['useremail'])['idperson'];

$exists = getCartProduct($user, $product);
if (!empty($exists)) {
    try {
        removeFromShoppingCart($user, $product);
    }
    catch (PDOException $e) {
        $_SESSION['error_msgs'][] = $e->getMessage();
    }
}
else {
    $_SESSION['error_msgs'][] = 'Product not in cart';
    header("Location: ".$_SERVER['HTTP_REFERER']);
    exit;
}

header("Location: ".$_SERVER['HTTP_REFERER']);
?>