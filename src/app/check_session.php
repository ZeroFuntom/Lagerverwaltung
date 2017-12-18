<?php
  session_start();
  header("Access-Control-Allow-Origin: *");
  if(isset($_SESSION['userid'])){
    echo "true";
  }else{
    echo "false";
  }


?>
