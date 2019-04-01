#!/bin/bash
# export DISPLAY=:99
/usr/bin/Xvfb :99 -screen 0 1024x768x24 -ac +extension GLX +render -noreset &
# cp "/home/qgis/projects/madera/ESRI US Forestry 2 Regular/ESRI US Forestry 2 Regular.ttf" /usr/share/fonts/
# fc-cache -f -v
APACHE_LOCK_FILE=/run/apache2/apache2.pid
[ -e $APACHE_LOCK_FILE ] && rm -f $APACHE_LOCK_FILE
XWINDOWSERVER_LOCK_FILE=/tmp/.X99-lock
[ -e $XWINDOWSERVER_LOCK_FILE ] && rm -f $XWINDOWSERVER_LOCK_FILE

QGIS_LOG_FILE=/var/log/qgis/qgisserver.log
touch $QGIS_LOG_FILE
chown www-data:www-data $QGIS_LOG_FILE

/usr/sbin/apachectl -D FOREGROUND &
echo "Open http://localhost:8080/cgi-bin/qgis_mapserv.fcgi?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetCapabilities"
tail -f $QGIS_LOG_FILE
