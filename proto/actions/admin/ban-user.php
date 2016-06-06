<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/users.php');

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

$user = $_POST['id'];

try {
    removeUser($user);
    $_SESSION['succ_msgs'][] = "User banned";
} catch(PDOException $e) {
    $_SESSION['error_msgs'][] = $e->getMessage();
}


header("Location: ".$_SERVER['HTTP_REFERER']);
?>