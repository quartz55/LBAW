<?php
include_once('../config/init.php');
include_once($BASE_DIR . 'database/users.php');

if (!$_POST['inputEmail'] || !$_POST['inputPassword']) {
  header('Location: '.$_SERVER['HTTP_REFERER']);
  exit;
}

$email = $_POST['inputEmail'];
$password = $_POST['inputPassword'];

$user = canLogin($email, $password);
if ($user == true) {
  $_SESSION['username'] = $user['name'];
}

header("Location: " . $BASE_URL . "pages/home.php");
 ?>
