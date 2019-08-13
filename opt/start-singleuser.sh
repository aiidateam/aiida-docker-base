#!/bin/bash -e

# This script is executed whenever the docker container is (re)started.

#===============================================================================
# debugging
set -x

#===============================================================================
# environment
export SHELL=/bin/bash

#===============================================================================
reentry scan

#===============================================================================
# create bashrc
if [ ! -e /home/aiida/.bashrc ]; then
   cp -v /etc/skel/.bashrc /etc/skel/.bash_logout /etc/skel/.profile /home/aiida/
   echo 'eval "$(verdi completioncommand)"' >> /home/aiida/.bashrc
   echo 'export PYTHONPATH="/home/aiida"' >> /home/aiida/.bashrc
   echo 'export PATH=$PATH:"/home/aiida/.local/bin"' >> /home/aiida/.bashrc
fi


#===============================================================================
# generate ssh key
if [ ! -e /home/aiida/.ssh/id_rsa ]; then
   mkdir -p /home/aiida/.ssh
   ssh-keygen -f /home/aiida/.ssh/id_rsa -t rsa -N ''
fi

#EOF
