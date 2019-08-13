#!/bin/bash -e

set -x

VERSION="$(grep 'install aiida' Dockerfile | cut -d'=' -f3)"

docker push yakutovich/aiida-base:${VERSION}

#EOF
