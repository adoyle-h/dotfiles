FROM alpine/git:1.0.7
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && apk update
RUN apk add bash python

ENV HOME=/adoyle
ENV DOTFILE_DIR=$HOME/dotfiles
WORKDIR $HOME

RUN git clone --depth 1 --progress https://github.com/adoyle-h/dotfiles.git $DOTFILE_DIR
RUN cd $DOTFILE_DIR && \
    git submodule update --init --progress

RUN $DOTFILE_DIR/pkgs/bash-it/install.sh --no-modify-config

RUN $DOTFILE_DIR/install || echo 'ok'

RUN bash -c ". $HOME/.bashrc && . $DOTFILE_DIR/bootstraps/reset-bash"

CMD bash
