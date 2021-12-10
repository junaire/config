FROM ubuntu:latest

MAINTAINER jun<jun@junz.org>

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update -y && \
		apt install -y software-properties-common \
                       libtinfo-dev \
                       libx11-xcb-dev
WORKDIR /
COPY bootstrap.sh .

RUN ./bootstrap.sh

RUN useradd -ms /bin/zsh jun
WORKDIR /home/jun
USER jun

RUN mkdir -p ~/config
COPY * ~/config/

RUN ~/config/deploy.sh

ENV LANG="C.UTF-8"

EXPOSE 22
ENTRYPOINT service ssh restart && zsh
