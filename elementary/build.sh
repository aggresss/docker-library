#!/bin/bash
# elementary build script

docker build -t aggresss/elementary:trusty -f trusty/Dockerfile ./
docker build -t aggresss/elementary:xenial -f xenial/Dockerfile ./
docker build -t aggresss/elementary:bionic -f bionic/Dockerfile ./
docker build -t aggresss/elementary:focal -f focal/Dockerfile ./
docker build -t aggresss/elementary:noble -f noble/Dockerfile ./
