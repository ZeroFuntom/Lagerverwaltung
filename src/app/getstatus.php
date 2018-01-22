<?php
  session_start();
  header("Access-Control-Allow-Origin: *");
  include("db.php");

  if(isset($_SESSION['userid'])){
    $userid = $_SESSION['userid'];
    $val = array( );

    $stmt = $odbc->prepare("CALL getstatus()");
    $stmt->execute();
    $row = $stmt->fetchAll();

    print json_encode($row);
  }
?>
