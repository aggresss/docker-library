#!/bin/bash
# docker-entrypoint.sh for docker aggresss/x11
set -eo pipefail
shopt -s nullglob

export DOCKER_ENTRYPOINT=1

# start supervisor daemon
sudo supervisord -c /etc/supervisor/supervisord.conf


if [ ! -d /home/docker ]; then
    sudo makedir -p /home/docker
    sudo chown docker:docker -R /home/docker
fi

exec "$@"

