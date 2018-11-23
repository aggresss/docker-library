#!/bin/bash
# reference: https://github.com/docker-library/mysql/blob/master/5.6/docker-entrypoint.sh
set -eo pipefail
shopt -s nullglob

JUPYTER_NOTEBOOK_PATH="/root/jupyter-notebook"

if [ "${1}" = 'bash' ]; then
    shift
    set -- bash "$@"
elif [ "${1}" = 'python' -o "${1}" = 'python3' ]; then
    shift
    set -- python3 "$@"
else
    set -- python3 "$@"
fi

exec "$@"

