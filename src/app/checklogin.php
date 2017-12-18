<?php
  session_start();
  include('db.php');

  $username = $_POST['username'];
  $password = $_POST['password'];

  $check_login = "CALL login('".$username."')";

  $result = $odbc->prepare($check_login);
  $result->execute();
  $user = $result->fetch();

  if(password_verify($password.$user['id_user'], $user['passwort'])){
    $_SESSION['userid'] = $user['id_user'];
    //echo $_SESSION['userid'];
    header('Location: list.html');
  }else{
    header('Location: login.html');
  }
  //echo "user: ".  $user['id_user'];

?>
