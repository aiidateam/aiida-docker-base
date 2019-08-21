#!/bin/bash -e

set -x

VERSION="$(grep 'install aiida' Dockerfile | cut -d'=' -f3)"

docker tag aiidateam/aiida-docker-base:latest aiidateam/aiida-docker-base:${VERSION}

#EOF
