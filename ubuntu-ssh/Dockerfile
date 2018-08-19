FROM ubuntu:16.04

MAINTAINER aggresss <aggresss@gmail.com>
LABEL VERSION="1.0"

# Pick up some build dependencies
RUN sed -i 's/archive.ubuntu/mirrors.aliyun/g' /etc/apt/sources.list && \
    apt-get update && apt-get install -y --no-install-recommends \
        tzdata \
        openssh-server \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Modify timezone to GTM+8
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Setup sshd service
RUN mkdir /var/run/sshd
RUN echo 'root:screencast' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

