# Dockerfile for cross-compile environment

FROM aggresss/elementary:bionic

MAINTAINER aggresss <aggresss@163.com>
LABEL DOCKER_IMAGE=aggresss/cross
ENV DOCKER_IMAGE=aggresss/cross

RUN apt-get update && apt-get install -y --no-install-recommends \
        python-dev \
        python3-dev \
        virtualenv \
        unrar \
        software-properties-common \
        lib32ncurses5-dev \
        gcc-multilib \
        valgrind \
        ffmpeg \
        nginx \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    \
    cd /usr/local/bin && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3 get-pip.py && python get-pip.py

WORKDIR /root
