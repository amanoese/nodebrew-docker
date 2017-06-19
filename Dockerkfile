FROM ubuntu

MAINTAINER amanoese

# update
RUN apt-get update && apt-get install -y wget perl

# add user docker
RUN groupadd -g 1000 docker && \
    useradd -g 1000 -G sudo -m -s /bin/bash docker && \
    echo 'docker:docker' | chpasswd

RUN su docker

# nodebrew + nodejs
ENV NODE_VERSION 5.7.1
RUN wget git.io/nodebrew
RUN perl nodebrew setup
ENV PATH /home/docker/.nodebrew/current/bin:/home/docker/.local/bin:/usr/local/s
RUN echo 'export PATH=/home/docker/.nodebrew/current/bin:/home/docker/.local/bin
RUN . /home/docker/.bashrc && nodebrew install-