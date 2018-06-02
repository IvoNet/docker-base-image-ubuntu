#!/usr/bin/env bash

DISTRO=https://partner-images.canonical.com/core/bionic/current/ubuntu-bionic-core-cloudimg-i386-root.tar.gz
HUB_NAME=ivonet
VERSION=18.04

curl -s -o rootfs.tar.gz ${DISTRO}
docker build -t ${HUB_NAME}/ubuntu:${VERSION} .
docker tag ivonet/ubuntu:18.04 ${HUB_NAME}/ubuntu:latest
docker rmi $(docker images -q -f dangling=true)
rm -f rootfs.tar.gz

docker run --rm ${HUB_NAME}/ubuntu:${VERSION} uname -a