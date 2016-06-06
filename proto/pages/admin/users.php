<?php
include_once('../../config/init.php');
include_once($BASE_DIR. 'database/users.php');

if (!isset($_SESSION['adminname'])) {
    $_SESSION['error_msgs'][] = "Unauthorized access";
    header("Location: " . $BASE_URL);
    exit;
}

$admins = getAdmins();
$clients = getClients();

$smarty->assign('admins', $admins);
$smarty->assign('clients', $clients);
$smarty->display('admin/users.tpl');
?>