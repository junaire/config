FROM ubuntu:20.04

MAINTAINER jun<jun@junz.org>

RUN ./bootstrap.sh

EXPOSE 22
ENTRYPOINT service ssh restart && zsh
