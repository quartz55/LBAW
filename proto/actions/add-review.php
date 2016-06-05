<?php
include_once('../config/init.php');
include_once($BASE_DIR . 'database/users.php');
include_once($BASE_DIR . 'database/reviews.php');

if (!isset($_SESSION['useremail'])) {
    $_SESSION['error_msgs'][] = 'You must be logged in to review';
    header('Location: '.$_SERVER['HTTP_REFERER']);
    exit;
}

if (!$_POST['product'] || !$_POST['rating']) {
  $_SESSION['error_msgs'][] = 'Invalid operation';
  header('Location: '.$_SERVER['HTTP_REFERER']);
  exit;
}

$client = getClient($_SESSION['useremail'])['idperson'];
$title = strip_tags($_POST['title']);
$description = strip_tags($_POST['description']);

try {
    addReview($client, $_POST['product'], $_POST['rating'], $title, $description);
}
catch (PDOException $e){
    $_SESSION['error_msgs'][] = $e->getMessage();
    header('Location: '.$_SERVER['HTTP_REFERER']);
    exit;
}

$_SESSION['succ_msgs'][] = "Review successfully added";
header("Location: " . $BASE_URL . "pages/products/product.php?id=".$_POST['product']);
?>