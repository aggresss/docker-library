# Dockerfile for golang environment

FROM aggresss/elementary:bionic

MAINTAINER aggresss <aggresss@163.com>
LABEL IMAGE=python VERSION=jupyter


# Python configuration
COPY pip.conf /root/.pip/
# Modify pip mirror
RUN apt-get update && apt -y install python3 python3-dev && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3 get-pip.py && \
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
        rm -rf /var/lib/apt/lists/*

COPY docker-entrypoint.sh /usr/local/bin/
EXPOSE 8888
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--allow-root","--ip=0.0.0.0"]
