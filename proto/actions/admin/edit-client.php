<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/users.php');

if (!isset($_SESSION['adminname'])) {
    $_SESSION['error_msgs'][] = 'Unauthorized access';
    header("Location: ".$_SERVER['HTTP_REFERER']);
    exit;
}

if (!isset($_POST['username']) || !isset($_POST['address'])) {
    $_SESSION['error_msgs'][] = 'Please fill all the required fields';
    header("Location: ".$_SERVER['HTTP_REFERER']);
    exit;
}

$id = $_POST['id'];
$name = strip_tags($_POST['username']);
$address = strip_tags($_POST['address']);

try {
    updateClient($id, $name, null, $address);
    $_SESSION['succ_msgs'][] = "Client edited";
} catch(PDOException $e) {
    $_SESSION['error_msgs'][] = $e->getMessage();
}


header("Location: ".$BASE_URL."pages/admin/users.php");
?>