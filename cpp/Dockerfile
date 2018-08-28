FROM ubuntu:18.04

MAINTAINER yujia <aggresss@163.com>
LABEL VERSION=2.0

ENV DEBIAN_FRONTEND noninteractive
ENV TZ=Asia/Shanghai

# Pick up some build dependencies
RUN sed -i 's/archive.ubuntu/mirrors.aliyun/g' /etc/apt/sources.list && \
apt-get update && apt-get install -y --no-install-recommends \
sudo \
man \
tzdata \
curl \
wget \
vim \
ssh \
git \
ca-certificates \
unzip \
xz-utils \
hexedit \
tmux \
build-essential \
gdb \
autoconf \
automake \
libtool \
python \
pkg-config \
flex \
bison \
yasm \
&& \
apt-get clean && \
rm -rf /var/lib/apt/lists/*

# VIM configuration
RUN wget -P /root https://raw.githubusercontent.com/aggresss/dotfiles/master/vim/.vimrc
