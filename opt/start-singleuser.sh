#!/bin/bash -e

# This script is executed whenever the docker container is (re)started.

#===============================================================================
# debugging
set -x

#===============================================================================
# environment
export SHELL=/bin/bash

#===============================================================================
# update the list available entry points
reentry scan

#===============================================================================
# generate ssh key
if [ ! -e /home/aiida/.ssh/id_rsa ]; then
   mkdir -p /home/aiida/.ssh
   ssh-keygen -f /home/aiida/.ssh/id_rsa -t rsa -N ''
fi

#EOF
