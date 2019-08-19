FROM ubuntu:20.04

LABEL maintainer="ADoyle <adoyle.h@gmail.com>"

ENV HOME=/root \
    TZ=Asia/Shanghai

WORKDIR $HOME

SHELL ["/bin/bash", "-c"]

RUN sed -E -i "s/(archive.ubuntu.com|security.ubuntu.com)/mirrors.aliyun.com/g" /etc/apt/sources.list && \
    apt-get -y update

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    DEBIAN_FRONTEND=noninteractive apt-get -y install dnsutils && \
    apt-get -y install \
        build-essential bash-completion iputils-ping netcat dnsutils curl wget ssh git neovim fzf tmux grip && \
    apt-get -y clean && \
    apt-get -y autoclean

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

ARG NODE_VERSION=14
ARG NODEJS_ORG_MIRROR="https://npm.taobao.org/mirrors/node"

ENV NODEJS_ORG_MIRROR=$NODEJS_ORG_MIRROR \
    NVM_NODEJS_ORG_MIRROR=$NODEJS_ORG_MIRROR

RUN . ~/.nvm/nvm.sh && \
    NVM_NODEJS_ORG_MIRROR="$NODEJS_ORG_MIRROR" nvm install $NODE_VERSION

RUN mkdir -p ~/{temp,src,Workspace,Presentations,Design,Documents,Public,Pictures,Downloads}

ENV DOTFILE_DIR=$HOME/dotfiles

RUN git clone --depth 1 --progress https://github.com/adoyle-h/dotfiles.git $DOTFILE_DIR
RUN cd $DOTFILE_DIR && \
    git submodule update --init --progress \
    $DOTFILE_DIR/install

COPY /etc/bash.bashrc
