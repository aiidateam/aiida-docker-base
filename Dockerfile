# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md
# Based on Ubuntu 18.04 since v0.11
FROM phusion/baseimage:0.11

USER root

# Add switch mirror to fix the issue
# https://github.com/aiidalab/aiidalab-docker-stack/issues/9
RUN echo "deb http://mirror.switch.ch/ftp/mirror/ubuntu/ bionic main \ndeb-src http://mirror.switch.ch/ftp/mirror/ubuntu/ bionic main \n" >> /etc/apt/sources.list

# install debian packages
# Note: prefix all 'apt-get install' lines with 'apt-get update' to prevent failures in partial rebuilds
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    tzdata

RUN apt-get update && apt-get install -y --no-install-recommends   \
    build-essential       \
    graphviz              \
    python3-dev           \
    python3-gi            \
    python3-gi-cairo      \
    python3-pip           \
    python3-psycopg2      \
    python3-setuptools    \
    python3-tk            \
    python3-wheel         \
    python-tk             \
    ssh                   \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean all

# Set Python3 be the default python version
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1

# Install AiiDA
RUN pip3 install aiida-core['rest','atomic_tools']==v1.0.0b5

# Add USER (no password)
RUN useradd -m -s /bin/bash aiida

# Install rest of the packages as normal user
USER aiida

# Populate reentry cache for aiida user https://pypi.python.org/pypi/reentry/
RUN reentry scan

# Set $HOME, create git directory
ENV HOME /home/aiida

# Make ssh dir and create host entry for bitbucket.org
RUN mkdir --mode=0700 $HOME/.ssh/ && \
    touch $HOME/.ssh/known_hosts

# Important to end as user root!
USER root

# Specify landing folder when login to the docker container
WORKDIR $HOME

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

#EOF
