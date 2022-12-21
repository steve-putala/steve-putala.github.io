---
title: Install xampp on Linux Mint
tags: xampp apache mysql install php
---

Notes that I made for myself years ago to install xampp on Linux Mint

**Warning:** These are old notes that I am not maintaining or updating
{: .message .warning}

## xampp

* Check http://localhost/ to see if Apache2 is already runnint
    * If it is running, remove it from the boot-up services
    * `sudo service apache2 stop`
    * `sudo update-rc.d -f  apache2 remove`
* Uninstall all Apache, PHP and MySQL you find in the software manager
* Download from Apache Friends and install using their .run installer
    * make executable `sudo chmod +x [FILE NAME]`
    * run the file `sudo ./[FILE NAME]`
* Change owner and group to myself `sudo vim /opt/lampp/etc/httpd.conf`
* Change the following part to your Linux user (don't use "steve" unless your user is "steve")

```
<IfModule unixd_module> 
  User steve
  Group steve 
</IfModule> 
```

* Start the server `sudo /opt/lampp/lampp start`
* Autostart lampp `sudo vim /etc/init.d/xampp`
* Add the following lines:

```
#!/bin/sh
### BEGIN INIT INFO
# Provides:          xampp
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start xampp at boot time
# Description:       Enable xampp provided by daemon.
### END INIT INFO

case "$1" in
start)
  /opt/lampp/lampp startapache && /opt/lampp/lampp startmysql
  ;;
stop)
  /opt/lampp/lampp stopapache && /opt/lampp/lampp stopmysql
  ;;
restart)
  $0 stop && $0 start
  ;;
status)
  /opt/lampp/lampp status
  ;;
*)
  # parameters are needed, echo usage options and return error code 1
  echo "Usage: {start|stop|restart|status}"
  exit 1;
  ;;
esac

# exit with the last code
exit $?
```

* `sudo chmod a+x /etc/init.d/xampp`
* `sudo update-rc.d xampp defaults`

## Install xdebug
    1. `sudo apt-get install php-xdebug`
    2. ~~Install from software manager~~

## Configure xDebug

```
sudo vim /opt/lampp/etc/php.ini
```

Add the following lines to the end of php.ini

```
zend_extension="/opt/lampp/lib/php/extensions/no-debug-non-zts-20121212/xdebug.so"
;xdebug.remote_enable=On
;xdebug.remote_host=”localhost”
;xdebug.remote_port=9000
;xdebug.remote_handler=”dbgp”xdebug.var_display_max_data=-1
xdebug.var_display_max_children=-1
xdebug.var_display_max_depth=3
```

```
sudo /opt/lampp/lampp restart
```

## Virtual Hosts

I don't remember exactly how I set up wildcard virtual host domains, but I can review other notes and fill this out more if anyone is interested.

`sudo vim /opt/lampp/apache2/conf/httpd.conf`

Add this for wildcard sub domains pointing to directory in htdocs, add to the bottom of the conf file

```
<VirtualHost *:80>
    VirtualDocumentRoot /opt/lampp/htdocs/%-2+/
</VirtualHost>
```

* Be sure to restart Apache after making changes
* symlink the config files based on the .sh in Dropbox/linux/config/lampp
* hosts file, update with any wildcard domains needed `sudo vim /etc/hosts`

## Configure mail
    
```
sudo apt-get install mailutils
sudo apt-get install sendmail
```

## Command Line php

```
sudo vim /etc/environment
```

Add the path (/opt/lampp/bin) to php to the $PATH variable at the beginning so it loads before Linux php

```
source /etc/environment
```

Check that php cli is loading the correct ini and running the correct version

```
php --ini
php -v
```

## phpunit

1. $ sudo apt-get install phpunit
2. ~~Install from software manager~~
3. ~~set up autoload and xml file~~

## PDO

1. Uncomment the PDO MySQL extension `sudo vim /opt/lampp/etc/php.ini`
2. Add the extension to the cli version of php.ini

## Find the ini

```
php -i | grep 'php.ini'
```

```
vim /etc/php5/cli/php.ini
```

## troubleshooting

* If phpunit is having problems loading the mysql driver try installing it: `sudo apt-get install php5-mysql`

## Uninstall xampp

```
sudo chmod +x /opt/lampp/uninstall
sudo /opt/lampp/uninstall
sudo rm -rf /opt/lampp
```
