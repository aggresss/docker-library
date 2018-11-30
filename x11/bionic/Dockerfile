# Dockerfile for x11 environment

FROM aggresss/elementary:bionic

MAINTAINER aggresss <aggresss@163.com>
LABEL IMAGE=aggresss/x11 VERSION=bionic

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
    rm -rf /var/lib/apt/lists/* \
    && \
    echo "docker:x:1000:1000::/home/docker:/bin/bash" >> /etc/passwd && \
    echo "docker:x:1000:" >> /etc/group && \
    echo "docker ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/docker && \
    chmod 0440 /etc/sudoers.d/docker && \
    mkdir -p /home/docker && \
    chown docker:docker -R /home/docker

COPY etc/ /etc/
COPY docker-entrypoint.sh /usr/local/bin/

USER docker
WORKDIR /home/docker

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["bash"]
