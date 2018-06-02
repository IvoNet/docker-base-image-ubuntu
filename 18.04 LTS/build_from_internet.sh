#!/usr/bin/env bash
set -e

DISTRO=https://partner-images.canonical.com/core/bionic/current/ubuntu-bionic-core-cloudimg-i386-root.tar.gz
HUB_NAME=ivonet
VERSION=18.04

DOCKER_ID=$(curl -s ${DISTRO} | docker import - ${HUB_NAME}/ubuntu:${VERSION})
docker tag ${DOCKER_ID} ${HUB_NAME}/ubuntu:latest
docker rmi $(docker images -q -f dangling=true)

docker run --rm ${HUB_NAME}/ubuntu:${VERSION} uname -a