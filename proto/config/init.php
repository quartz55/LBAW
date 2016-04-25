<?php
  session_set_cookie_params(3600, '/lbaw/');
  session_start();

  error_reporting(E_ERROR | E_WARNING); // E_NOTICE by default

  $BASE_DIR = '/home/john/public_html/lbaw/';
  $BASE_URL = '/lbaw/';

  $conn = new PDO('pgsql:host=localhost;dbname=lbaw', 'lbaw', '');
  $conn->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

/* $conn->exec('SET SCHEMA \'frmk\'');
 */
  include_once($BASE_DIR . 'lib/smarty/Smarty.class.php');

  $smarty = new Smarty;
  $smarty->template_dir = $BASE_DIR . 'views/';
  $smarty->compile_dir = $BASE_DIR . 'tmp/';
  $smarty->cache_dir = $BASE_DIR . 'cache/';
  $smarty->assign('BASE_URL', $BASE_URL);

?>
