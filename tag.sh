#!/bin/bash -e

set -x

VERSION="$(grep 'install aiida' Dockerfile | cut -d'=' -f3)"

docker tag yakutovich/aiida-docker-base:latest yakutovich/aiida-docker-base:${VERSION}

#EOF
