#!/bin/bash
# Auto generate Dockerfile for aggresss/elementary

DIST_DIR=.
DOCKERFILE=Dockerfile
###############################################################################
# distribution   codename    mirror
###############################################################################
declare -a DISTRIBUTIONS=( \
    "ubuntu      xenial      s/archive.ubuntu/mirrors.aliyun/g" \
    "ubuntu      bionic      s/archive.ubuntu/mirrors.aliyun/g" \
    "debian      jessie      s/deb.debian.org/mirrors.aliyun.com/g" \
    "debian      stretch     s/deb.debian.org/mirrors.aliyun.com/g" \
    )

################################################################################
for D in "${DISTRIBUTIONS[@]}"
do
    declare -a ARRAY=(${D})
    DISTRIBUTION=${ARRAY[0]}
    CODENAME=${ARRAY[1]}
    MIRROR=${ARRAY[2]}
    echo ${DISTRIBUTION} "|" ${CODENAME} "|" ${MIRROR}
    mkdir -p ${DIST_DIR}/${CODENAME}
    cat << END > ${DIST_DIR}/${CODENAME}/${DOCKERFILE}
# Dockerfile for ${CODENAME} and auto generate by
# https://github.com/aggresss/docker-library/blob/master/elementary/autogen.sh
FROM ${DISTRIBUTION}:${CODENAME}

MAINTAINER aggresss <aggresss@163.com>
LABEL IMAGE=aggresss/elementary VERSION=${CODENAME}

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

# Pick up some build dependencies
RUN sed -i '${MIRROR}' /etc/apt/sources.list && \\
    apt-get update && apt-get install -y --no-install-recommends \\
        sudo \\
        man \\
        tzdata \\
        locales \\
        tree \\
        curl \\
        wget \\
        vim \\
        ssh \\
        git \\
        ca-certificates \\
        unzip \\
        xz-utils \\
        hexedit \\
        tmux \\
        build-essential \\
        gdb \\
        gdbserver \\
        autoconf \\
        automake \\
        libtool \\
        ccache \\
        python \\
        pkg-config \\
        flex \\
        bison \\
        yasm \\
        gawk \\
        net-tools \\
        iputils-ping \\
        netcat \\
        && \\
    apt-get clean && \\
    rm -rf /var/lib/apt/lists/*

END
done

