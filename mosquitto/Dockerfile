# Dockerfile for mosquitto environment

FROM aggresss/elementary:bionic

MAINTAINER aggresss <aggresss@163.com>
LABEL DOCKER_IMAGE=aggresss/mosquitto
ENV DOCKER_IMAGE=aggresss/mosquitto

# configure environment for mosquitto
RUN apt-get update && apt-get install -y --no-install-recommends \
    mosquitto \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* \
    && \
    echo "[program:mosquitto]" > /etc/supervisor/conf.d/mosquitto.conf && \
    echo "command=/usr/sbin/mosquitto -c /etc/mosquitto/mosquitto.conf" >> /etc/supervisor/conf.d/mosquitto.conf

EXPOSE 1883
EXPOSE 8883
USER root

