FROM ubuntu:20.04

MAINTAINER jun<jun@junz.org>

RUN ./bootstrap.sh
RUN ./deploy.sh

EXPOSE 22
ENTRYPOINT service ssh restart && zsh
