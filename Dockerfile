FROM debian:11

MAINTAINER Солопов Никита гр. 728-1

COPY ./bash .
RUN apt-get update
RUN apt-get upgrade
RUN apt-get install isomd5sum -y
RUN chmod +x ./bash
CMD ./bash
