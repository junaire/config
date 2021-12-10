FROM ubuntu:20.04

MAINTAINER jun<jun@junz.org>

RUN apt update -y && \
		apt install -y software-properties-common \
                       libtinfo-dev \
                       libx11-xcb-dev
RUN ./bootstrap.sh

RUN useradd -ms /bin/zsh jun
WORKDIR /home/jun
USER jun

RUN ./deploy.sh

ENV LANG="C.UTF-8"

EXPOSE 22
ENTRYPOINT service ssh restart && zsh
