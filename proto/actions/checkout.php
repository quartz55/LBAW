<?php
include_once('../config/init.php');
include_once($BASE_DIR . 'database/users.php');
include_once($BASE_DIR . 'database/purchases.php');

if (!isset($_SESSION['useremail'])) {
    $_SESSION['error_msgs'][] = 'Unauthorized access';
    header("Location: ".$_SERVER['HTTP_REFERER']);
    exit;
}

$user = getClient($_SESSION['useremail'])['idperson'];

try {
    checkout($user);
} catch (PDOException $e) {
    $_SESSION['error_msgs'][] = $e->getMessage();
}
$_SESSION['succ_msgs'][] = "Checkout successful, thank you for your purchase";

header("Location: ".$_SERVER['HTTP_REFERER']);
?>