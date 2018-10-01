#!/bin/bash
# export DISPLAY=:99
/usr/bin/Xvfb :99 -screen 0 1024x768x24 -ac +extension GLX +render -noreset &
echo "Open http://localhost:8080/cgi-bin/qgis_mapserv.fcgi?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetCapabilities"
/usr/sbin/apachectl -D FOREGROUND &
touch /var/log/qgis/qgisserver.log
tail -f /var/log/qgis/qgisserver.log
