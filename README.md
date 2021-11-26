roundcube-login-check
=====================

This allows you to monitor whether login to RoundCube works

# Dependencies

* php
* php-cli
* php-curl

# Installation

    # LC_ALL=C ls -l /usr/local/lib/Roundcube-Login-Check/
    total 12
    -rw-r--r-- 1 root root 3940 Nov 26 18:05 RoundcubeAutoLogin.php
    -rwxr-xr-x 1 root root  438 Nov 26 18:11 check_roundcube.sh
    -rw-r--r-- 1 root root  436 Nov 26 18:00 try_to_log_in_to_roundcube.php

    # ls -l /etc/RoundcubeAutoLoginConfig.php 
    -rw------- 1 nagios root 113 Nov 26 17:59 /etc/RoundcubeAutoLoginConfig.php

# Deployment via ansible

Look in the [./ansible](./ansible) directory for an ansible role to deploy
the files.

# Icinga config

RoundcubeAutoLoginConfig.php should be only readable for the `nagios` user!

    # cat /etc/icinga2/zones.d/roundcube/services.conf
    
    object CheckCommand "check_roundcube" {
      command = [ "/usr/local/lib/Roundcube-Login-Check/check_roundcube.sh" ]
      arguments = {   }
    }
    
    object Service "http-roundcube-login" {
      import "generic-service"
    
      check_command = "check_roundcube"
    
      check_interval = 1d
      vars.notification_interval = 1d
    
      host_name = "roundcube"
    }

