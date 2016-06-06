<?php
include_once('../config/init.php');
include_once($BASE_DIR . 'database/users.php');

if (!$_POST['adminname'] || !$_POST['pass']) {
    header('Location: '.$_SERVER['HTTP_REFERER']);
    exit;
}

$name = strip_tags($_POST['adminname']);
$password = strip_tags($_POST['pass']);

$admin = canAuthenticate($name, $password);
if (!empty($admin)) {
    $_SESSION['succ_msgs'][] = "Welcome " . $admin['name'] . "!";
    $_SESSION['adminname'] = $admin['name'];
} else {
    $_SESSION['error_msgs'][] = 'Invalid credentials';
    header("Location: " . $_SERVER['HTTP_REFERER']);
    exit;
}

header("Location: " . $BASE_URL . "pages/admin/control-panel.php");
?>
