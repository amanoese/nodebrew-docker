FROM ubuntu

MAINTAINER amanoese

ARG INSTALL_NODES
ARG USE_NODE_VERSION

# update
RUN apt-get update && apt-get install -y curl perl sudo

# add user docker
RUN groupadd -g 1000 docker && \
    useradd -g 1000 -G sudo -m -s /bin/bash docker && \
    echo 'docker:docker' | chpasswd

USER docker
ENV HOME /home/docker

# nodebrew + nodejs
RUN curl -L git.io/nodebrew | perl - setup

ENV PATH $HOME/.nodebrew/current/bin:$PATH
RUN echo export 'PATH=$HOME/.nodebrew/current/bin:$PATH' >> $HOME/.bashrc
RUN echo ${INSTALL_NODES:-$(nodebrew ls-remote | xargs -n1 | tac | awk -F. '{print $0" "$1}' | uniq -f1 | awk '{print $1}' | xargs)} \
    | xargs -n1 nodebrew install-binary
RUN echo ${USE_NODE_VERSION:-$(nodebrew ls | grep -e '[0-9]' | sed -r 's/[0-9].*/& &/' | sort -rk2 | head -1 | awk '{print $1}')} \
    | xargs nodebrew use 

CMD /bin/bash
