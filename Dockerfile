FROM ubuntu:14.04
MAINTAINER Tiago Rolim <tiago.rol@gmail.com>

#Non interactive
ENV DEBIAN_FRONTEND noninteractive

#Atualizando o Linux
RUN sudo apt-get update && \
    sudo apt-get -y upgrade

#Instalando o wget
RUN sudo apt-get -y install wget

#Instalando o apache
RUN sudo apt-get -y install apache2

#Instalndo o php
RUN sudo apt-get -y install php5-gd php5-mysql libapache2-mod-php5

#Instalando o wordpress
RUN sudo wget http://wordpress.org/latest.tar.gz && \
    sudo tar -xzvf latest.tar.gz && \
    sudo cp wordpress/wp-config-sample.php wordpress/wp-config.php

ADD wp-config.php wordpress/wp-config.php
RUN chmod 644 wordpress/wp-config.php

#Permissões
RUN rm -rf /var/www/html/index.html
RUN sudo cp -r wordpress/* /var/www/html
RUN chown -R www-data:www-data /var/www/html
RUN sudo chmod g+w /var/www -R

ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

EXPOSE 80

CMD ["/usr/local/bin/run.sh"]
