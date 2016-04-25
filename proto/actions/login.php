<?php
include_once('../config/init.php');
include_once($BASE_DIR . 'database/users.php');

if (!$_POST['email'] || !$_POST['pass']) {
  header('Location: '.$_SERVER['HTTP_REFERER']);
  exit;
}

$email = $_POST['email'];
$password = $_POST['pass'];

$user = canLogin($email, $password);
if ($user == true) {
  echo $user;
  echo $user['name'];
  $_SESSION['username'] = $user['name'];
}
else {
  header("Location: " . $_SERVER['HTTP_REFERER']);
  exit;
}

header("Location: " . $BASE_URL . "pages/home.php");
 ?>
