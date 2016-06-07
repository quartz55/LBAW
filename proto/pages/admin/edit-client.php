<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/users.php');

if (!isset($_SESSION['adminname'])) {
    $_SESSION['error_msgs'][] = "Unauthorized access";
    header("Location: " . $BASE_URL);
    exit;
}

if (!isset($_GET['id'])) {
    $_SESSION['error_msgs'][] = "Invalid Operation";
    header("Location: " . $BASE_URL);
    exit;
}

$client = getClient(null, $_GET['id']);

$smarty->assign('client', $client);

$smarty->display('admin/edit-client.tpl');
?>