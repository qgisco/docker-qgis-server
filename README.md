# docker-qgis-server

docker qgis 3 server using instructions of https://docs.qgis.org/testing/en/docs/training_manual/qgis_server/install.html

## Add new projects

You can put new projects in directory *projects* and use URL like:
```url
http://localhost:8080/cgi-bin/qgis_mapserv.fcgi?MAP=/home/qgis/projects/world.qgs&SERVICE=WMS&REQUEST=GetCapabilities
```
Change the param "MAP" to new path like *MAP=/home/qgis/projects/my_new_project.qgs*
