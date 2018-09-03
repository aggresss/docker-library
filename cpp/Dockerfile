FROM ubuntu:18.04

MAINTAINER aggresss <aggresss@163.com>
LABEL IMAGE=aggresss/elementary
LABEL VERSION=18.04

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
ccache \
python \
pkg-config \
flex \
bison \
yasm \
gawk \
net-tools \
iputils-ping \
netcat \
&& \
apt-get clean && \
rm -rf /var/lib/apt/lists/*
