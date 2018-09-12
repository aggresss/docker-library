# NOTICE !!! ONLY FOR DEBUG USE. DO NOT USE IN FORMAL ENVIRONMNET
# fork from https://docs.docker.com/engine/examples/running_ssh_service/

FROM aggresss/elementary:bionic

MAINTAINER aggresss <aggresss@gmail.com>
LABEL IMAGE="openssh-server" VERSION="bionic"

# Pick up some build dependencies and environment
RUN apt-get update && apt-get install -y --no-install-recommends \
openssh-server \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
echo "--- build environment ---" && \
    mkdir /var/run/sshd && \
    echo 'root:changepassword' | chpasswd && \
    sed -r -e 's/^PermitRootLogin.*$/PermitRootLogin yes/' -e 's/#PermitRootLogin.*$/PermitRootLogin yes/' -i /etc/ssh/sshd_config && \
    sed -r -e 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd && \
echo "--- build complete ---"

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
