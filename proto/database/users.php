<?php

function getAdmins() {
    global $conn;
    $stmt = $conn->prepare("SELECT * From Person JOIN SystemAdministrator using (idperson)");
    $stmt->execute();
    return $stmt->fetchAll();
}

function getClients() {
    global $conn;
    $stmt = $conn->prepare("SELECT * From Person JOIN Client using (idperson)");
    $stmt->execute();
    return $stmt->fetchAll();
}

function canAuthenticate($admin, $pass) {
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM Person JOIN SystemAdministrator using (idperson) WHERE name = ? AND password = ?");
    $stmt->execute(array($admin, sha1($pass)));
    return $stmt->fetch();
}

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
  return $stmt->fetch();
}

function registerClient($email, $name, $pass, $addr) {
  global $conn;

  $conn->beginTransaction();

  try {
      $stmt = $conn->prepare("INSERT INTO person (name, password) VALUES (?, ?)");
      $stmt->execute(array($name, sha1($pass)));
      $id = $conn->lastInsertId('person_idperson_seq');
      $stmt = $conn->prepare("INSERT INTO client VALUES (?, ?, ?)");
      $stmt->execute(array($id, $addr, $email));

      $conn->commit();
  }
  catch (PDOException $e) {
      $conn->rollBack();
      throw $e;
  }
}

function updateClient($id, $name, $pass, $addr) {
    global $conn;

    $conn->beginTransaction();

    try {
        if (!$pass) {
            $stmt = $conn->prepare('UPDATE Person SET name=? WHERE idperson=?');
            $stmt->execute(array($name,$id));
        }
        else {
            $stmt = $conn->prepare('UPDATE Person SET name=?,password=? WHERE idperson=?');
            $stmt->execute(array($name,sha1($pass),$id));
        }

        $stmt = $conn->prepare('UPDATE Client SET address=? WHERE idperson=?');
        $stmt->execute(array($addr,$id));

        $conn->commit();
    }
    catch (PDOException $e) {
        $conn->rollBack();
        throw $e;
    }

}

function removeUser($id) {
    global $conn;
    $stmt = $conn->prepare("DELETE FROM Person WHERE idperson = ?");
    $stmt->execute(array($id));
    return $stmt->fetch();
}

function createAdmin($name, $pass) {
    global $conn;
    $conn->beginTransaction();
    try {
        $stmt = $conn->prepare("INSERT INTO Person (name, password) VALUES (?, ?)");
        $stmt->execute(array($name, sha1($pass)));

        $id = $conn->lastInsertId('person_idperson_seq');
        $stmt = $conn->prepare("INSERT INTO SystemAdministrator VALUES (?)");
        $stmt->execute(array($id));

        $conn->commit();
    } catch (PDOException $e) {
        $conn->rollBack();
        throw $e;
    }
}

?>
