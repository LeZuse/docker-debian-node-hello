# DOCKER-VERSION 0.3.4
FROM debian:7.4

MAINTAINER Tomas Ruzicka <tomasruzicka@abdoc.net>

RUN apt-get update && apt-get -y install git-core curl build-essential openssl libssl-dev

RUN apt-get -y install python

RUN git clone https://github.com/joyent/node.git

WORKDIR node

RUN git checkout v0.10.28

RUN ./configure --openssl-libpath=/usr/lib/ssl
RUN make
RUN make install

ADD . /src

RUN cd /src && npm install

EXPOSE 8080

CMD ["node", "/src/index.js"]

