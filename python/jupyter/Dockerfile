# Dockerfile for golang environment

FROM aggresss/elementary:bionic

MAINTAINER aggresss <aggresss@163.com>
LABEL IMAGE=python VERSION=jupyter

# Python configuration
COPY pip.conf /root/.pip/
# Modify pip mirror
RUN apt-get update && apt-get -y install apt-utils python3 python3-dev && \
    cd /usr/local/bin && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3 get-pip.py && \
    cd /usr/bin && rm -rf python && ln -s python3 python && \
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
WORKDIR /root/jupyter-notebook/
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--allow-root", "--ip=0.0.0.0"]
