FROM ubuntu:16.04

MAINTAINER aggresss <aggresss@163.com>
LABEL IMAGE=golang VERSION=1.10.3

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
build-essential \
gdb \
autoconf \
automake \
libtool \
pkg-config \
flex \
bison \
yasm \
&& \
apt-get clean && \
rm -rf /var/lib/apt/lists/*

# VIM configuration
RUN wget -P /root https://raw.githubusercontent.com/aggresss/dotfiles/master/vim/.vimrc

# Modify timezone to GTM+8
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Golang configuration
RUN curl -OL http://pdi3zh561.bkt.clouddn.com/go/go1.10.3.linux-amd64.tar.gz && \
tar -C /usr/local -xzf go1.10.3.linux-amd64.tar.gz && \
rm -rf go1.10.3.linux-amd64.tar.gz
ENV GOPATH /go
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
WORKDIR $GOPATH
