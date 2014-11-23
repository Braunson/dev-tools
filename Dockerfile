FROM ubuntu:14.04

MAINTAINER Conrad Kleinespel

RUN mkdir /data

RUN locale-gen en_US.UTF-8 && echo 'LANG="en_US.UTF-8"' > /etc/default/locale

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y wget curl tar python make gcc g++ ruby python3
RUN apt-get install -y mcrypt
RUN apt-get install -y php5 php5-cli php5-pgsql php5-intl php5-mcrypt php5-json

RUN php5enmod mcrypt
RUN php5enmod intl
RUN php5enmod json
RUN php5enmod pgsql

RUN wget -O /data/phpunit https://phar.phpunit.de/phpunit.phar
RUN ln -s /data/phpunit /usr/local/bin/

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apt-get install -y postgresql-client

RUN gem update
RUN gem install sass

RUN wget -O /data/node.tar.gz http://nodejs.org/dist/v0.10.33/node-v0.10.33-linux-x64.tar.gz
RUN cd /data && tar -xzf node.tar.gz
RUN ln -s /data/node-v0.10.33-linux-x64/bin/node /usr/local/bin/
RUN ln -s /data/node-v0.10.33-linux-x64/bin/npm /usr/local/bin/

RUN npm install -g gulp
RUN npm install -g bower

ADD . /scripts/

ENTRYPOINT ["/scripts/run.bash"]
