#!/bin/bash -e

set -x

VERSION="$(grep 'install aiida' Dockerfile | cut -d'=' -f3)"

docker tag yakutovich/aiida-base:latest yakutovich/aiida-base:${VERSION}

#EOF
