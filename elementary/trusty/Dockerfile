# Dockerfile for trusty and auto generate by
# https://github.com/aggresss/docker-library/blob/master/elementary/autogen.sh
FROM ubuntu:trusty

MAINTAINER aggresss <aggresss@163.com>
LABEL DOCKER_IMAGE=aggresss/elementary:trusty
ENV DOCKER_IMAGE=aggresss/elementary:trusty
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

# Pick up some build dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
        software-properties-common \
        sudo \
        cron \
        xclip \
        man \
        tzdata \
        locales \
        supervisor \
        stow \
        tree \
        psmisc \
        curl \
        wget \
        rsync \
        vim \
        exuberant-ctags \
        cscope \
        telnet \
        ssh \
        mosh \
        openssh-server \
        git \
        ca-certificates \
        bc \
        jq \
        cpio \
        unzip \
        zip \
        xz-utils \
        p7zip-full \
        gnupg \
        hexedit \
        chrpath \
        diffstat \
        tmux \
        build-essential \
        pstack \
        gdb \
        gdbserver \
        automake \
        libtool \
        gettext \
        autopoint \
        cmake \
        cmake-curses-gui \
        ccache \
        python \
        python3 \
        pkg-config \
        flex \
        bison \
        nasm \
        yasm \
        gawk \
        net-tools \
        iputils-ping \
        dnsutils \
        netcat \
        socat \
        tcpdump \
        x11-apps \
        && \
    (apt-get -y --no-install-recommends libtool-bin || echo) && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    \
    echo "docker:x:1000:1000::/home/docker:/bin/bash" >> /etc/passwd && \
    echo "docker:x:1000:" >> /etc/group && \
    echo "docker ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/docker && \
    chmod 0440 /etc/sudoers.d/docker && \
    mkdir -p /home/docker && \
    chown docker:docker -R /home/docker \
    && \
    wget -P /usr/local/bin https://github.com/aggresss/dotfiles/raw/master/update_dotfiles.sh && \
    chmod 755 /usr/local/bin/update_dotfiles.sh \
    && \
    echo "#!/bin/bash" > /usr/local/bin/docker-entrypoint.sh && \
    sed -r -e 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/cron && \
    echo "sudo /etc/init.d/cron start" >> /usr/local/bin/docker-entrypoint.sh && \
    echo "sudo supervisord -c /etc/supervisor/supervisord.conf" >> /usr/local/bin/docker-entrypoint.sh && \
    echo "exec \"\$@\"" >> /usr/local/bin/docker-entrypoint.sh && \
    chmod 755 /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["bash"]

