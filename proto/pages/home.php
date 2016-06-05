<?php
include_once('../config/init.php');
include_once($BASE_DIR.'database/products.php');
include_once($BASE_DIR.'database/utils.php');

$featured = getFeatured();
$discounts = getDiscounts();

$smarty->assign('featured', $featured);
$smarty->assign('discounts', $discounts);

$smarty->display('home.tpl');
?>
