FROM ubuntu:16.04

MAINTAINER ezio <ezio_zhang@outlook.com>

ENV DEBIAN_FRONTEND=noninteractive 

RUN sed -i.bak s/archive.ubuntu.com/mirror.tuna.tsinghua.edu.cn/g /etc/apt/sources.list && \
  dpkg --add-architecture i386 && apt-get update && apt-get install -y \
  build-essential \
  sudo \
  iproute2 \
  gawk \
  net-tools \
  expect \
  libncurses5-dev \
  tftpd \
  libssl-dev \
  gnupg \
  wget \
  socat \
  gcc-multilib \
  screen \
  xterm \
  gzip \
  unzip \
  cpio \
  chrpath \
  autoconf \
  lsb-release \
  locales \
  xutils-dev \
  mtd-utils \
  tmux \
  net-tools \
  git \
  vim \
  bc \
  texinfo diffstat python2.7 python \
  dos2unix  doxygen  libc6:i386 libncurses5:i386 libstdc++6:i386 libz1:i386
  
RUN locale-gen en_US.UTF-8 && update-locale

#ENV http_proxy=http://192.168.3.7:1080
#ENV https_proxy=http://192.168.3.7:1080
#ENV ftp_proxy=http://192.168.3.7:1080

#RUN git config --global http.proxy 'socks5://192.168.3.7:1080' \
#  git config --global https.proxy 'socks5://192.168.3.7:1080'

RUN adduser --disabled-password --gecos '' tis && \
  usermod -aG sudo tis && \
  echo "tis ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER tis 
ENV HOME /home/tis
ENV LANG en_US.UTF-8
RUN mkdir /home/tis/project
WORKDIR /home/tis/project
