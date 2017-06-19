FROM ubuntu

MAINTAINER amanoese

# update
RUN apt-get update && apt-get install -y wget perl

# add user docker
#RUN groupadd -g 1000 docker && \
#    useradd -g 1000 -G sudo -m -s /bin/bash docker && \
#    echo 'docker:docker' | chpasswd
#
#RUN su docker

# nodebrew + nodejs
ENV NODE_VERSION 5.7.1
RUN wget git.io/nodebrew
RUN perl nodebrew setup
ENV $PATH PATH=$HOME/.nodebrew/current/bin:$PATH
RUN echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> $HOME/.bashrc && \
RUN nodebrew install-binary $NODE_VERSION && \
RUN nodebrew use $NODE_VERSION
