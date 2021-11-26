<?php

  // https://github.com/alexjeen/Roundcube-AutoLogin
  //
  include 'RoundcubeAutoLogin.php';
  include '/etc/RoundcubeAutoLoginConfig.php';
  
  $rc = new RoundcubeAutoLogin($url);
  $cookies = $rc->login($user, $pass);
  
  if( is_array($cookies) ) {
    echo("login successful\n");
    exit(0);
  
  } else {
    // error message from `$rc->login` doesn't include newline
    echo("\nlogin failed\n");
    exit(1);
  
  }

?>
