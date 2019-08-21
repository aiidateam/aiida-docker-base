# AiiDA docker base
This repository contains the Docker file that installs [AiiDA](http://www.aiida.net)
and its Python dependencies.

## Updating the image
In order to update the AiiDA version, go to Docker file and change the following line:
```
RUN pip3 install aiida-core[ ... ]==vX.Y.Z

```
Adapt X.Y.Z numbers to the latest AiiDA version. Once this is done,
run the following commands:

```
./build.sh # to build the new aiida-docker-base image locally and tag it as 'latest'
./tag.sh # to specify the AiiDA version number as the image's tag
./push.sh # to push the image tagged with the version number to the Docker Hub
./push_latest.sh # to push the image tagged with 'latest' to the Docker Hub
```

The docker image contains:
 * minimal Ubuntu base image (phusion/baseimage)
 * Python 3 environment
 * user `aiida`
 * `aiida-core` and its dependencies pip-installed
 * `PYTHONPATH` (in `/home/aiida/.bashrc` points to `/home/aiida`)
 * `PATH` (in `/home/aiida/.bashrc` points to `/home/aiida/.local/bin`)

# Docker Hub repository

The corresponding docker image is built automatically on Docker Hub:

https://hub.docker.com/r/aiidateam/aiida-docker-base


# Acknowledgements

This work is supported by the [MARVEL National Centre for Competency in Research](<http://nccr-marvel.ch>)
funded by the [Swiss National Science Foundation](<http://www.snf.ch/en>), as well as by the [MaX
European Centre of Excellence](<http://www.max-centre.eu/>) funded by the Horizon 2020 EINFRA-5 program,
Grant No. 676598.

![MARVEL](miscellaneous/logos/MARVEL.png)
![MaX](miscellaneous/logos/MaX.png)
