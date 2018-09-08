# Dockerfile for bionic and auto generate by
# https://github.com/aggresss/docker-library/blob/master/elementary/autogen.sh
FROM ubuntu:bionic

MAINTAINER aggresss <aggresss@163.com>
LABEL IMAGE=aggresss/elementary VERSION=bionic

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

