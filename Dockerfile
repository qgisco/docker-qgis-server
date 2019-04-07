FROM debian:stretch

LABEL description="Generic QGIS Server \
container with some examples of use."
LABEL maintainer="juusechec@gmail.com"
USER root
# link: https://stackoverflow.com/questions/44376852/how-to-start-apache2-automatically-in-a-ubuntu-docker-container#44377561

# https://docs.qgis.org/testing/en/docs/training_manual/qgis_server/install.html
COPY config/debian-qgis.list /etc/apt/sources.list.d/

# https://www.qgis.org/en/site/forusers/alldownloads.html#debian-ubuntu
RUN apt-get update -y \
  && apt-get upgrade -y \
  && apt-get install qgis-server python-qgis -y --allow-unauthenticated \
  && apt-get install xvfb -y \
  && apt-get install apache2 libapache2-mod-fcgid apache2-utils -y \
  && apt-get install curl wget unzip vim ipython3 -y \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean

# RUN apt-get dist-upgrade -y

RUN mkdir /var/log/qgis/
RUN chown www-data:www-data /var/log/qgis

RUN mkdir -p /home/qgis
RUN mkdir /home/qgis/qgisserverdb
RUN chown www-data:www-data /home/qgis/qgisserverdb

COPY  config/qgis.demo.conf /etc/apache2/sites-available/
RUN a2enmod rewrite
RUN a2enmod fcgid
RUN a2dissite 000-default
RUN a2ensite qgis.demo

EXPOSE 80

COPY config/entrypoint.sh /root
CMD ["/root/entrypoint.sh"]
