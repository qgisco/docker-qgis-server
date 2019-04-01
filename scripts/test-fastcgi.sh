#!/usr/bin/env bash
LC_ALL="en_US.UTF-8" \
PYTHONIOENCODING=UTF-8 \
LANG="en_US.UTF-8" \
QGIS_SERVER_LOG_FILE=/var/log/qgis/qgisserver.log \
QGIS_SERVER_LOG_LEVEL=0 \
QGIS_DEBUG=0 \
QGIS_PLUGINPATH="/home/qgis/plugins/" \
QGIS_AUTH_DB_DIR_PATH="/home/qgis/qgisserverdb/" \
QGIS_AUTH_PASSWORD_FILE="/home/qgis/qgisserverdb/qgis-auth.db" \
DISPLAY=":99" \
QUERY_STRING="SERVICE=HELLO" \
/usr/lib/cgi-bin/qgis_mapserv.fcgi