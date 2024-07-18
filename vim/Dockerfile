FROM ubuntu

RUN apt update && apt upgrade -y
RUN apt install vim curl git -y

RUN useradd -ms /bin/bash test

USER test

WORKDIR /home/test

RUN echo 'export COLORTERM=truecolor' >> /home/test/.bashrc
RUN echo 'export TERM=screen-256color' >> /home/test/.bashrc

COPY .vimrc .vimrc
