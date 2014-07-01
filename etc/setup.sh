#!/bin/bash 

APP_NAME=tornado-test
INSTALL_PATH=/svr/$APP_NAME
DAEMON_NAME=${APP_NAME}d

app_root=$(cd $(dirname $0);cd ../; pwd)

echo "\n\n== Setup Files =="
mkdir -pv $INSTALL_PATH
cp -r $app_root/* $INSTALL_PATH
chown $LOGNAME $INSTALL_PATH
chmod 755 $INSTALL_PATH

echo "\n\n== Make symbolic link to nginx config =="
ln -s $app_root/etc/tornado.nginx /etc/nginx/sites-available/$APP_NAME
ln -s /etc/nginx/sites-available/$APP_NAME /etc/nginx/sites-enabled/$APP_NAME

echo "\n\n== Register service =="
ln -s $app_root/etc/tornadod /etc/init.d/$DAEMON_NAME
/etc/init.d/$DAEMON_NAME start

## If you want to start deamon on system launched
#insserv -d $DAEMON_NAME

echo "\n\n== Complete setup =="
echo "Please restart nginx server"
