FROM ubuntu:14.04

MAINTAINER Conrad Kleinespel

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y wget tar python make gcc g++ ruby python3

RUN gem update
RUN gem install sass

RUN wget http://nodejs.org/dist/v0.10.33/node-v0.10.33-linux-x64.tar.gz
RUN tar -xzf node-v0.10.33-linux-x64.tar.gz
RUN ln -s /node-v0.10.33-linux-x64/bin/node /usr/local/bin/
RUN ln -s /node-v0.10.33-linux-x64/bin/npm /usr/local/bin/

RUN npm install -g gulp
RUN npm install -g bower

ADD . /scripts/

ENTRYPOINT ["/scripts/run.bash"]
