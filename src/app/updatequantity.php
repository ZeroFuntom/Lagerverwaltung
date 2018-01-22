<?php
   header("Access-Control-Allow-Origin: *");
   include("db.php");

   $neuemenge = $_REQUEST['nm'];
   $idq = $_REQUEST['idq'];


   $stmt = $odbc->prepare("CALL updatequantity(".$idq.", ".$neuemenge.")");
   $stmt->execute();

   echo "Lager wurde aktualisiert!";
?>
