<?php
include_once('../../config/init.php');

if (!isset($_SESSION['adminname'])) {
    $_SESSION['error_msgs'][] = "Unauthorized access";
    header("Location: " . $BASE_URL);
    exit;
}

$smarty->display('admin/create-admin.tpl');
?>