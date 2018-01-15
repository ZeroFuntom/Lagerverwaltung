<?php
   header("Access-Control-Allow-Origin: *");
   include("db.php");

   $id = $_REQUEST['bestellnr'];
   $cmt = $_REQUEST['com'];
   $anz = $_REQUEST['an'];
   $status = $_REQUEST['sts'];

   $stmt = $odbc->prepare("CALL updatepurchases(".$id.", '".$cmt."', ".$anz.", ".$status.")");
   $stmt->execute();

   echo "Änderungen vorgenommen!";
?>
