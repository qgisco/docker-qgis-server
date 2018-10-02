# docker-qgis-server

docker container fo qgis 3 server using instructions of https://docs.qgis.org/testing/en/docs/training_manual/qgis_server/install.html

## Requirements:
- docker: https://docs.docker.com/install/linux/docker-ce/ubuntu/
- docker-compose: https://docs.docker.com/compose/install/#install-compose

## Run
You can run the command:
```sh
docker-compose up
```
For more specific documentation about docker-compose read https://docs.docker.com/compose/reference/overview/

## Add new projects

You can put new projects in directory ***projects*** and use URL like:
```url
http://localhost:8080/cgi-bin/qgis_mapserv.fcgi?MAP=/home/qgis/projects/world.qgs&SERVICE=WMS&REQUEST=GetCapabilities
```
Change the param "MAP" to new path like *MAP=/home/qgis/projects/my_new_project.qgs*
