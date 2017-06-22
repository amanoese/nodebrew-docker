FROM ubuntu

MAINTAINER amanoese

# nvs is install node versions
ARG nv

# unv is use node version
ARG unv

# update
RUN apt-get update && apt-get install -y curl perl

USER root
ENV HOME /root

# nodebrew + nodejs
RUN curl -L git.io/nodebrew | perl - setup

ENV PATH $HOME/.nodebrew/current/bin:$PATH
RUN echo export 'PATH=$HOME/.nodebrew/current/bin:$PATH' >> $HOME/.bashrc
RUN echo ${nv:-$(nodebrew ls-remote | xargs -n1 | tac | awk -F. '{print $0" "$1}' | uniq -f1 | awk '{print $1}' | xargs)} \
    | xargs -n1 nodebrew install-binary
RUN echo ${unv:-$(nodebrew ls | grep -e '[0-9]' | sed -r 's/[0-9].*/& &/' | sort -rk2 | head -1 | awk '{print $1}')} \
    | xargs nodebrew use 

CMD /bin/bash
