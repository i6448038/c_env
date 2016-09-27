FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y vim


FROM gcc
WORKDIR /workspace
ADD . /workspace
RUN chmod 777 -R /workspace
VOLUME ["/workspace"]