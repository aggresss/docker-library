# Dockerfile for xenial and auto generate by
# https://github.com/aggresss/docker-library/blob/master/elementary/autogen.sh
FROM ubuntu:xenial

MAINTAINER aggresss <aggresss@163.com>
LABEL IMAGE=aggresss/elementary VERSION=xenial

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

# Pick up some build dependencies
RUN sed -i 's/archive.ubuntu/mirrors.aliyun/g' /etc/apt/sources.list && \
    apt-get update && apt-get install -y --no-install-recommends \
        sudo \
        man \
        tzdata \
        locales \
        tree \
        curl \
        wget \
        rsync \
        vim \
        ssh \
        git \
        ca-certificates \
        unzip \
        xz-utils \
        p7zip-full \
        hexedit \
        tmux \
        build-essential \
        gdb \
        gdbserver \
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

