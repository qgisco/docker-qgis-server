#!/bin/bash
# export DISPLAY=:99
/usr/bin/Xvfb :99 -screen 0 1024x768x24 -ac +extension GLX +render -noreset &
# cp "/home/qgis/projects/madera/ESRI US Forestry 2 Regular/ESRI US Forestry 2 Regular.ttf" /usr/share/fonts/
# fc-cache -f -v
/usr/sbin/apachectl -D FOREGROUND &
echo "Open http://localhost:8080/cgi-bin/qgis_mapserv.fcgi?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetCapabilities"
touch /var/log/qgis/qgisserver.log
tail -f /var/log/qgis/qgisserver.log
