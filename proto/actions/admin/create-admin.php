<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/users.php');

if (!isset($_SESSION['adminname'])) {
    $_SESSION['error_msgs'][] = 'Unauthorized access';
    header("Location: ".$_SERVER['HTTP_REFERER']);
    exit;
}

if (!isset($_POST['username']) ||
    !isset($_POST['pass']) ||
    !isset($_POST['passconfirm'])) {

    $_SESSION['error_msgs'][] = 'Invalid operation';
    header("Location: ".$_SERVER['HTTP_REFERER']);
    exit;
}

$name = strip_tags($_POST['username']);
$password = strip_tags($_POST['pass']);
$confirm = strip_tags($_POST['passconfirm']);

if ($confirm !== $password) {
    $_SESSION['error_msgs'][] = 'Passwords don\'t match';
    header("Location: ".$_SERVER['HTTP_REFERER']);
    exit;
}

try {
    createAdmin($name, $password);
    $_SESSION['succ_msgs'][] = "Admin created";
} catch(PDOException $e) {
    $_SESSION['error_msgs'][] = $e->getMessage();
}


header("Location: ".$BASE_URL."pages/admin/users.php");
?>