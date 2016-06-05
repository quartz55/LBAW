<?php

function canReview($user, $product) {
    global $conn;
    $stmt = $conn->prepare("SELECT Purchase.* FROM Checkout JOIN Purchase using (idcheckout) WHERE idperson = ? AND idproduct = ?");
    $stmt->execute(array($user, $product));

    $stmt2 = $conn->prepare("SELECT * FROM Rate where idperson = ? AND idproduct = ?");
    $stmt2->execute(array($user, $product));
    return !empty($stmt->fetchAll()) && empty($stmt2->fetch());
}

function getReviews($id) {
    $final = array();

    global $conn;
    $stmt = $conn->prepare("SELECT Rate.*, Person.name FROM Rate JOIN Person using (idPerson) WHERE idProduct=? ORDER BY date DESC");
    $stmt->execute(array($id));
    $final["reviews"] = $stmt->fetchAll();

    $stmt = $conn->prepare("SELECT AVG(rating) FROM Rate WHERE idProduct=?");
    $stmt->execute(array($id));
    $final["avg"] = round($stmt->fetch()['avg'], 1);

    return $final;
}

function addReview($user, $product, $rating, $title, $description) {
    global $conn;
    $stmt = $conn->prepare("INSERT INTO Rate VALUES (?, ?, NOW(), ?, ?, ?)");
    $stmt->execute(array($user, $product, $rating, $title, $description));
    return $stmt->fetch();
}

?>