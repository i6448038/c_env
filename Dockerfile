FROM ubuntu:16.04

FROM gcc

RUN apt-get update
RUN apt-get install -y vim
RUN apt-get install -y bison
RUN apt-get install -y re2c


WORKDIR /root/workspace
RUN git clone https://github.com/php/php-src.git 
RUN cd php-src
WORKDIR /root/workspace/php-src
RUN git checkout PHP-7.0
RUN ./buildconf
RUN ./configure
RUN make
RUN make install
RUN cd ..
RUN mkdir outPut
ADD . /root/outPut
RUN chmod 777 -R /root/outPut
VOLUME ["/root/outPut"]