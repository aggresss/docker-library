# Dockerfile for python environment

FROM aggresss/elementary:bionic

MAINTAINER aggresss <aggresss@163.com>
LABEL IMAGE=python VERSION=bionic

RUN apt-get update && apt-get -y install apt-utils python3 python3-dev && \
    cd /usr/local/bin && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3 get-pip.py && \
    mkdir -p /root/.pip && \
    echo "[global]" > /root/.pip/pip.conf && \
    echo "index-url = https://mirrors.aliyun.com/pypi/simple/" >> /root/.pip/pip.conf && \
    echo "[install]" >> /root/.pip/pip.conf && \
    echo "trusted-host = mirrors.aliyun.com" >> /root/.pip/pip.conf && \
    pip install --upgrade pip && \
    pip install \
        numpy \
        scipy \
        matplotlib \
        pillow \
        jupyter \
        jupyterlab \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* \
    && \
    mkdir -p /root/jupyter-notebook && \
    echo "[program:jupyter]" > /etc/supervisor/conf.d/jupyter.conf && \
    echo "command=cd /root/jupyter-notebook && jupyter notebook --port=8888 --no-browser --allow-root --ip=0.0.0.0" >> /etc/supervisor/conf.d/jupyter.conf

EXPOSE 8888

