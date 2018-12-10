# Dockerfile for x11 environment

FROM aggresss/elementary:bionic

MAINTAINER aggresss <aggresss@163.com>
LABEL DOCKER_IMAGE=aggresss/x11
ENV DOCKER_IMAGE=aggresss/x11

# configure environment for x11
RUN apt-get update && apt-get install -y --no-install-recommends \
    openjdk-8-jdk \
    xorg \
    dbus-x11 \
    fonts-dejavu \
    fonts-wqy-microhei \
    fonts-wqy-zenhei \
    xterm \
    vim-gtk \
    remmina \
    okular \
    ffmpeg \
    vlc \
    imagemagick \
    meld \
    feh \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER docker
WORKDIR /home/docker

