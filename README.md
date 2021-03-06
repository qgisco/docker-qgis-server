# docker-qgis-server

docker container for qgis 3 server using instructions of https://docs.qgis.org/testing/en/docs/training_manual/qgis_server/install.html

## Requirements
- docker: https://docs.docker.com/install/linux/docker-ce/ubuntu/
- docker-compose: https://docs.docker.com/compose/install/#install-compose

## Run
You can run the command:
```sh
git clone https://gitlab.com/juusechec/docker-qgis-server
cd docker-qgis-server
docker-compose up
```
Next, open the resource:
```
http://localhost:8080/cgi-bin/qgis_mapserv.fcgi?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetCapabilities
```
For more specific documentation about docker-compose read https://docs.docker.com/compose/reference/overview/

## Use without build
The docker command to use the container:
```sh
docker run \
  -d \
  -p 8080:8080 \
  --name=qgis-server \
  -v projects:/home/qgis/projects \
  qgisco/qgis-server:latest
```
Optionally you can use some examples in docker-compose:
```sh
curl -sSL https://raw.githubusercontent.com/qgisco/docker-qgis-server/master/examples/docker-compose-with-postgres.yml > docker-compose.yml
docker-compose up
```
See examples forder for more case of use.

## Container Image
Docker container image is available in: 
- https://hub.docker.com/r/qgisco/qgis-server

## Add new projects

You can put new projects in directory ***projects*** and use a URL like:
```url
http://localhost:8080/cgi-bin/qgis_mapserv.fcgi?MAP=/home/qgis/projects/world.qgs&SERVICE=WMS&REQUEST=GetCapabilities
```
Change the param "MAP" to new path like *MAP=/home/qgis/projects/my_new_project.qgs* where
***my_new_project.qgs*** is a file in a path ***projects*** out of container.

## Some question?

- Please create a new issue: https://github.com/qgisco/docker-qgis-server/issues/new
