<?php
include_once('../config/init.php');
include_once($BASE_DIR . 'database/users.php');

if (!$_POST['email'] || !$_POST['name'] || !$_POST['pass'] || !$_POST['addr']) {
  $_SESSION['error_msgs'][] = 'Please provide all the fields';
  header('Location: '.$_SERVER['HTTP_REFERER']);
  exit;
}

$email = strip_tags($_POST['email']);
$name = strip_tags($_POST['name']);
$password = strip_tags($_POST['pass']);
$addr = strip_tags($_POST['addr']);

try {
    registerClient($email, $name, $password, $addr);
}
catch (PDOException $e){
    if (strpos($e->getMessage(), 'client_email_key') !== false) {
        $_SESSION['error_msgs'][] = 'Email is already in use';
    }
    else {
        $_SESSION['error_msgs'][] = $e->getMessage();
    }
  header('Location: '.$_SERVER['HTTP_REFERER']);
  exit;
}

$_SESSION['succ_msgs'][] = "Registration was successful, you can now login";
header("Location: " . $BASE_URL . "pages/home.php");
 ?>
