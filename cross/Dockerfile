# Dockerfile for cross-compile environment

FROM aggresss/elementary:bionic

MAINTAINER aggresss <aggresss@163.com>
LABEL DOCKER_IMAGE=aggresss/cross
ENV DOCKER_IMAGE=aggresss/cross

RUN apt-get update && apt-get install -y --no-install-recommends \
        lib32ncurses5-dev \
        gcc-multilib \
        valgrind \
        software-properties-common \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

