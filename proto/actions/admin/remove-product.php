<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/products.php');

if (!isset($_SESSION['adminname'])) {
    $_SESSION['error_msgs'][] = 'Unauthorized access';
    header("Location: ".$_SERVER['HTTP_REFERER']);
    exit;
}

if (!isset($_POST['id'])) {
    $_SESSION['error_msgs'][] = 'Invalid operation';
    header("Location: ".$_SERVER['HTTP_REFERER']);
    exit;
}

$id = $_POST['id'];

try {
    removeProduct($id);
    $_SESSION['succ_msgs'][] = "Product removed";
} catch(PDOException $e) {
    $_SESSION['error_msgs'][] = $e->getMessage();
}


header("Location: ".$BASE_URL."pages/admin/products.php");
?>