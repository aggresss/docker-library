#!/bin/bash
# Auto generate Dockerfile for aggresss/elementary

DIST_DIR=.
DOCKERFILE=Dockerfile
readonly UBUNTU="xenial bionic"
readonly DEBIAN="jessie stretch"
readonly DISTRIBUTION="${DEBIAN} ${UBUNTU}"

################################################################################
for CODENAME in ${DISTRIBUTION}
do
mkdir -p ${DIST_DIR}/${CODENAME}
cat << END > ${DIST_DIR}/${CODENAME}/${DOCKERFILE}
# Dockerfile for ${CODENAME} and auto generate by 
# https://github.com/aggresss/docker-library/blob/master/elementary/autogen.sh
END
done

################################################################################
for CODENAME in ${UBUNTU}
do
cat << END >> ${DIST_DIR}/${CODENAME}/${DOCKERFILE}
FROM ubuntu:${CODENAME}

END
done

for CODENAME in ${DEBIAN}
do
cat << END >> ${DIST_DIR}/${CODENAME}/${DOCKERFILE}
FROM debian:${CODENAME}

END
done

################################################################################
for CODENAME in ${DISTRIBUTION}
do
cat << END >> ${DIST_DIR}/${CODENAME}/${DOCKERFILE}
MAINTAINER aggresss <aggresss@163.com>
LABEL IMAGE=aggresss/elementary VERSION=${CODENAME}

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

# Pick up some build dependencies
END
done

################################################################################
for CODENAME in ${UBUNTU}
do
cat << END >> ${DIST_DIR}/${CODENAME}/${DOCKERFILE}
RUN sed -i 's/archive.ubuntu/mirrors.aliyun/g' /etc/apt/sources.list && \\
END
done

for CODENAME in ${DEBIAN}
do
cat << END >> ${DIST_DIR}/${CODENAME}/${DOCKERFILE}
RUN sed -i 's/deb.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list && \\
END
done

################################################################################
for CODENAME in ${DISTRIBUTION}
do
cat << END >> ${DIST_DIR}/${CODENAME}/${DOCKERFILE}
    apt-get update && apt-get install -y --no-install-recommends \\
        sudo \\
        man \\
        tzdata \\
        locales \\
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

