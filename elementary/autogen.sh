#!/bin/bash
# Auto generate Dockerfile for aggresss/elementary

DIST_DIR=.
DOCKERFILE=Dockerfile
###############################################################################
# distribution   codename
###############################################################################
declare -a DISTRIBUTIONS=( \
    "ubuntu      trusty" \
    "ubuntu      xenial" \
    "ubuntu      bionic" \
    "debian      jessie" \
    "debian      stretch" \
    )

################################################################################
for D in "${DISTRIBUTIONS[@]}"
do
    declare -a ARRAY=(${D})
    DISTRIBUTION=${ARRAY[0]}
    CODENAME=${ARRAY[1]}
    echo "|" ${DISTRIBUTION} "|" ${CODENAME} "|"
    mkdir -p ${DIST_DIR}/${CODENAME}
    cat << END > ${DIST_DIR}/${CODENAME}/${DOCKERFILE}
# Dockerfile for ${CODENAME} and auto generate by
# https://github.com/aggresss/docker-library/blob/master/elementary/autogen.sh
FROM ${DISTRIBUTION}:${CODENAME}

MAINTAINER aggresss <aggresss@163.com>
LABEL DOCKER_IMAGE=aggresss/elementary:${CODENAME}
ENV DOCKER_IMAGE=aggresss/elementary:${CODENAME}
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

# Pick up some build dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \\
        sudo \\
        cron \\
        man \\
        tzdata \\
        locales \\
        supervisor \\
        stow \\
        tree \\
        psmisc \\
        curl \\
        wget \\
        rsync \\
        vim \\
        exuberant-ctags \\
        cscope \\
        ssh \\
        mosh \\
        openssh-server \\
        git \\
        ca-certificates \\
        bc \\
        jq \\
        cpio \\
        unzip \\
        xz-utils \\
        p7zip-full \\
        hexedit \\
        tmux \\
        build-essential \\
        gdb \\
        gdbserver \\
        automake \\
        libtool \\
        cmake \\
        ccache \\
        python \\
        pkg-config \\
        flex \\
        bison \\
        nasm \\
        yasm \\
        gawk \\
        net-tools \\
        iputils-ping \\
        netcat \\
        socat \\
        && \\
    apt-get clean && \\
    rm -rf /var/lib/apt/lists/* && \\
    \\
    echo "docker:x:1000:1000::/home/docker:/bin/bash" >> /etc/passwd && \\
    echo "docker:x:1000:" >> /etc/group && \\
    echo "docker ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/docker && \\
    chmod 0440 /etc/sudoers.d/docker && \\
    mkdir -p /home/docker && \\
    chown docker:docker -R /home/docker \\
    && \\
    echo "#!/bin/bash" > /usr/local/bin/docker-entrypoint.sh && \\
    sed -r -e 's@session\\s*required\\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/cron && \\
    echo "/etc/init.d/cron start" >> /usr/local/bin/docker-entrypoint.sh && \\
    echo "sudo supervisord -c /etc/supervisor/supervisord.conf" >> /usr/local/bin/docker-entrypoint.sh && \\
    echo "exec \"\\\$@\"" >> /usr/local/bin/docker-entrypoint.sh && \\
    chmod 755 /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["bash"]

END
done

