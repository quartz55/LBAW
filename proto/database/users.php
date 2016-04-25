<?php
function canLogin($email, $pass) {
  global $conn;
  $stmt = $conn->prepare("SELECT * FROM client JOIN person USING (idperson) WHERE email = ? AND password = ?");
  $stmt->execute(array($email, sha1($pass)));
  return $stmt->fetch();
}

function getClient($email) {
  global $conn;
  $stmt = $conn->prepare("SELECT * FROM client JOIN person USING (idperson) WHERE email = ?");
  $stmt->execute(array($email));
  return $stmt->fetchAll();
}

function registerClient($email, $name, $pass, $addr) {
  global $conn;
  $stmt = $conn->prepare("INSERT INTO person (name, password) VALUES (?, ?)");
  $stmt->execute(array($name, sha1($pass)));
  $id = $conn->lastInsertId('person_idperson_seq');
  var_dump($id);
  $stmt = $conn->prepare("INSERT INTO client VALUES (?, ?, ?)");
  $stmt->execute(array($id, $addr, $email));
}
?>
