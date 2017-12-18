<?php
  $pw = "panda";
  $id = 1;

  $pwh = password_hash($pw.$id, PASSWORD_DEFAULT);

  echo $pwh;
?>
