FROM ubuntu:latest

MAINTAINER jun<jun@junz.org>

RUN apt update -y && \
		apt install -y software-properties-common sudo
WORKDIR /

COPY bootstrap.sh .
RUN ./bootstrap.sh

RUN useradd jun -ms /usr/bin/zsh && \
	usermod -aG sudo jun && \
	echo "jun:1234" | chpasswd

RUN mkdir -p /home/jun/config
COPY . /home/jun/config/

USER jun
WORKDIR /home/jun
RUN config/deploy.sh

ENV LANG="C.UTF-8"
