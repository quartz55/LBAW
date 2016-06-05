<?php

function getRecentPurchases($user) {
  global $conn;
  $stmt = $conn->prepare("SELECT Product.*, date, Purchase.price as rprice FROM checkout JOIN purchase USING (idcheckout) JOIN product using (idproduct) WHERE idperson = ? ORDER BY date DESC LIMIT 3");
  $stmt->execute(array($user));
  return $stmt->fetchAll();
}

    function getPurchaseHistory($user) {
global $conn;
$stmt = $conn->prepare("SELECT Product.*, date, Purchase.price as rprice FROM checkout JOIN purchase USING (idcheckout) JOIN product using (idproduct) WHERE idperson = ? ORDER BY date DESC GROUP BY idcheckout");
$stmt->execute(array($user));
return $stmt->fetchAll();
}

?>