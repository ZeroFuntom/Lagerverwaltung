<?php
  session_start();
  include("db.php");

  $anzahl = $_POST['anzahl'];
  $id = $_POST['id_produkt'];
  $iduser = $_SESSION['userid'];
  $datum = date("Y-m-d");

  $stmt = $odbc->prepare("CALL addpurchase('".$datum."', ".$id.", ".$iduser.", ".$anzahl.")");
  $stmt->execute();

  header('Location: list.html');

?>
