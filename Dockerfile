FROM php:7.3.10-buster

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_NO_INTERACTION 1

RUN apt-get update && \
  apt-get install -y libxml2-dev && \
  docker-php-ext-install soap && \
  docker-php-ext-enable soap && \
  apt-get install -y python3-pip && \
  apt-get -y install gnupg && \
  curl -sS https://packages.treasuredata.com/GPG-KEY-td-agent | apt-key add - && \
  echo "deb http://packages.treasuredata.com/3/ubuntu/xenial/ xenial contrib" > /etc/apt/sources.list.d/treasure-data.list && \
  apt-get update && \
  apt-get install -y td-agent && \
  curl -sS https://getcomposer.org/installer -o composer-setup.php && \
  php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
  composer && \
  rm composer-setup.php
  apt-get -y install git
