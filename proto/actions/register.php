<?php
include_once('../config/init.php');
include_once($BASE_DIR . 'database/users.php');

if (!$_POST['email'] || !$_POST['name'] || !$_POST['pass'] || !$_POST['addr']) {
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
  var_dump($e->getMessage());
  exit;
}
header("Location: " . $BASE_URL . "pages/home.php");
 ?>
