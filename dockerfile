FROM ubuntu:20.04

ARG USER=docker
ARG PASS="docker"

USER root

RUN apt update && apt install -y sudo
RUN sudo apt install -y openssh-server ufw net-tools ansible
RUN sudo ufw allow ssh
RUN useradd -m $USER && echo "$USER:$PASS" | chpasswd && adduser docker sudo

EXPOSE 22

CMD sudo service ssh start && /bin/bash