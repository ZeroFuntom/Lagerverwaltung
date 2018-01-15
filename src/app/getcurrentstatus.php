<?php
  session_start();
  header("Access-Control-Allow-Origin: *");
  include("db.php");

  $val = array( );
  $ids = $_REQUEST['ids'];

  $stmt = $odbc->prepare("CALL getcurrentstatus(".$ids.")");
  $stmt->execute();
  $row = $stmt->fetchAll();

  print json_encode($row);
?>
