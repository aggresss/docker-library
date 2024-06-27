#!/bin/bash
# elementary push script

docker login
docker push aggresss/elementary:trusty
docker push aggresss/elementary:xenial
docker push aggresss/elementary:bionic
docker push aggresss/elementary:focal
docker push aggresss/elementary:noble
