# Dockerfile for cross-compile environment

FROM aggresss/elementary:bionic

MAINTAINER aggresss <aggresss@163.com>
LABEL DOCKER_IMAGE=aggresss/cross
ENV DOCKER_IMAGE=aggresss/cross

RUN dpkg --add-architecture i386 && \
    apt-get update && apt-get install -y --no-install-recommends \
        gcc-multilib \
        lib32ncurses5-dev \
        lib32z1 \
        libexpat1-dev:i386 \
        doxygen \
        valgrind \
        unrar \
        python-dev \
        python3-dev \
        virtualenv \
        nodejs \
        npm \
        ffmpeg \
        nginx \
        mosquitto \
        mosquitto-clients \
        gyp \
        libtool-bin \
        && \
    apt-get install -y gcc-aarch64-linux-gnu g++-aarch64-linux-gnu && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    \
    cd /usr/local/bin && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3 get-pip.py && python get-pip.py

CMD ["bash"]

