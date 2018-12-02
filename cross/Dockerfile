# Dockerfile for cross-compile environment

FROM aggresss/elementary:bionic

MAINTAINER aggresss <aggresss@163.com>
LABEL IMAGE=aggresss/cross VERSION=bionic

RUN apt-get update && apt-get install -y --no-install-recommends \
        lib32ncurses5-dev \
        gcc-multilib \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

