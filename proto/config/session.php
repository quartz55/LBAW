<?php
  $smarty->assign('BASE_URL', $BASE_URL);
  $smarty->assign('USERNAME', $_SESSION['username']);
  $smarty->assign('ERROR_MSGS', $_SESSION['error_msgs']);
  $smarty->assign('SUCCESS_MSGS', $_SESSION['succ_msgs']);

  unset($_SESSION['error_msgs']);
  unset($_SESSION['succ_msgs']);
 ?>
