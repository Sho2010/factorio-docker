FROM ubuntu:latest

MAINTAINER Sho2010<sho20100@gmail.com>

RUN apt-get update &&\
  apt-get install -y curl && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /factorio
RUN curl -L -k https://www.factorio.com/get-download/0.12.29/headless/linux64 | tar --strip-components=1 -xzf -

VOLUME ["/factorio/saves"]
ENV WORLD_NAME=world0

EXPOSE 34197/udp

CMD /factorio/bin/x64/factorio --start-server $WORLD_NAME
