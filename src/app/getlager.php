<?php
  session_start();
  header("Access-Control-Allow-Origin: *");
  include("db.php");

  $val = array( );
  $id = $_REQUEST['idb'];

  $stmt = $odbc->prepare("CALL getlager(".$id.")");
  $stmt->execute();
  $row = $stmt->fetchAll();

  print json_encode($row);
?>
