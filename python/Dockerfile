# Dockerfile for python environment

FROM aggresss/elementary:bionic

MAINTAINER aggresss <aggresss@163.com>
LABEL DOCKER_IMAGE=aggresss/python
ENV DOCKER_IMAGE=aggresss/python

WORKDIR /root/jupyter-notebook

RUN apt-get update && apt-get -y install python-dev python3-dev && \
    cd /usr/local/bin && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python get-pip.py && python3 get-pip.py && \
    mkdir -p /root/.pip && \
    echo "[global]" > /root/.pip/pip.conf && \
    echo "index-url = https://mirrors.aliyun.com/pypi/simple/" >> /root/.pip/pip.conf && \
    echo "[install]" >> /root/.pip/pip.conf && \
    echo "trusted-host = mirrors.aliyun.com" >> /root/.pip/pip.conf && \
    pip3 install --upgrade pip && \
    pip3 install \
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
    echo "[program:jupyter]" > /etc/supervisor/conf.d/jupyter.conf && \
    echo "command=jupyter notebook --port=8888 --no-browser --allow-root --ip=0.0.0.0" >> /etc/supervisor/conf.d/jupyter.conf

EXPOSE 8888

