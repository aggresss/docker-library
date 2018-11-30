# Dockerfile for X11 environment

FROM aggresss/elementary:bionic

MAINTAINER aggresss <aggresss@163.com>
LABEL IMAGE=aggresss/X11 VERSION=xmonad

# configure environment for X11
RUN apt-get update && apt-get install -y --no-install-recommends \
    dbus-x11 \
    xorg \
    xterm \
    xmonad \
    vlc \
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
USER docker
WORKDIR /home/docker
CMD ["sudo", "supervisord", "-c", "/etc/supervisor/supervisord.conf"]
