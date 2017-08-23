FROM ubuntu:16.04
MAINTAINER cybermans <cybermans@gmail.com>
LABEL version 20170823

RUN echo "deb http://archive.ubuntu.com/ubuntu xenial multiverse" >> /etc/apt/sources.list 
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:jcfp/ppa && \
    add-apt-repository -y ppa:mosquitto-dev/mosquitto-ppa && \
    apt-get update && \
    apt-get install -y sabnzbdplus && \ 
    #apt-get install -y sabnzbdplus-theme-classic sabnzbdplus-theme-mobile sabnzbdplus-theme-plush \ &&
    apt-get install -y par2 python-yenc unzip rar mosquitto-clients && \
    apt-get -y autoremove && \
    apt-get -y clean


RUN mkdir -p /config && \
    mkdir -p /data

EXPOSE 8080 9090

VOLUME ["/config"]
VOLUME ["/data"]


ENTRYPOINT ["/usr/bin/sabnzbdplus"]
CMD ["--config-file","/config","--server",":8080","--console"]