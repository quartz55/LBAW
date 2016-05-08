<?php
include_once('../config/init.php');
include_once($BASE_DIR . 'database/users.php');

if (!isset($_SESSION['useremail'])) {
    $_SESSION['error_msgs'][] = "Unauthorized access";
    header("Location: " . $BASE_URL);
    exit;
}

if (!$_POST['username'] || !$_POST['address']) {
    $_SESSION['error_msgs'][] = "Please fill all the fields";
    header('Location: '.$_SERVER['HTTP_REFERER']);
    exit;
}
else if ($_POST['newpass'] !== $_POST['newpassconfirm']) {
    $_SESSION['error_msgs'][] = "Passwords don't match";
    header('Location: '.$_SERVER['HTTP_REFERER']);
    exit;
}

$client = getClient($_SESSION['useremail']);

$username = $_POST['username'];
$address = $_POST['address'];
$pass = false;
if ($_POST['newpass'] !== '') $pass = $_POST['newpass'];

try {
    updateClient($client['idperson'], $username, $pass, $address);
}
catch (PDOException $e) {
    $_SESSION['error_msgs'][] = $e->getMessage();
    header("Location: ".$_SERVER['HTTP_REFERER']);
    exit;
}

$_SESSION['username'] = $username;
$_SESSION['succ_msgs'][] = "Successfully edited profile";
header("Location: " . $BASE_URL . "pages/users/profile.php");
?>
