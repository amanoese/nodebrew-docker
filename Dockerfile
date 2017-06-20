FROM ubuntu

MAINTAINER amanoese

# update
RUN apt-get update && apt-get install -y curl perl sudo

# add user docker
RUN groupadd -g 1000 docker && \
    useradd -g 1000 -G sudo -m -s /bin/bash docker && \
    echo 'docker:docker' | chpasswd

USER docker
ENV HOME /home/docker

# nodebrew + nodejs
ENV NODE_VERSION stable
RUN curl -L git.io/nodebrew | perl - setup

ENV PATH $HOME/.nodebrew/current/bin:$PATH
RUN echo $PATH
RUN echo export 'PATH=$HOME/.nodebrew/current/bin:$PATH' >> $HOME/.bashrc
RUN which nodebrew
RUN nodebrew install-binary $NODE_VERSION && nodebrew use $NODE_VERSION
CMD /bin/bash
