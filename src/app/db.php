<?php
  //error_reporting(0);
  $user = "root";
  $pw = "";
  //$con = new PDO('mysql:host=localhost;dbname=m151_personendaten', $user, $pw);
  $odbc = new PDO("odbc:m151_lagerverwaltung", $user, $pw);
?>
