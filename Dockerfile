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
RUN curl -L git.io/nodebrew | perl - setup

ENV PATH $HOME/.nodebrew/current/bin:$PATH
RUN echo $PATH
RUN echo export 'PATH=$HOME/.nodebrew/current/bin:$PATH' >> $HOME/.bashrc
RUN which nodebrew
RUN nodebrew ls-remote | xargs -n1 | tac | awk -F. '{print $0" "$1}' | uniq -f1 | awk '{print $1}' | xargs -n1 nodebrew install-binary
RUN nodebrew ls | xargs nodebrew use stable
CMD /bin/bash
