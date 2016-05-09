<?php
include_once('../../config/init.php');
include_once($BASE_DIR . "database/users.php");

if (!isset($_SESSION['useremail'])) {
    $_SESSION['error_msgs'][] = "Unauthorized access";
    header("Location: " . $BASE_URL);
    exit;
}

$client = getClient($_SESSION['useremail']);

$smarty->assign('client', $client);
$smarty->display('users/edit_profile.tpl');
?>
