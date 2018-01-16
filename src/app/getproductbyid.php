<?php
  session_start();
  header("Access-Control-Allow-Origin: *");
  include("db.php");

  $id = $_REQUEST["idpr"];

  $stmt = $odbc->prepare("CALL getproductbyid(".$id.")");
  $stmt->execute();
  $row = $stmt->fetchAll();

  print json_encode($row);
?>
