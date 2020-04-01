# DEPRECATED
Consider to use aiidateam/aiida-core image shipped along with the aiida-core repository. Here
are the useful links:

 * Docker Hub link: https://hub.docker.com/r/aiidateam/aiida-core
 * Link to the Docker file: https://github.com/aiidateam/aiida-core/blob/develop/Dockerfile
 * List of other containers that are currently maintained: https://github.com/aiidateam/aiida-core/wiki/AiiDA-containers


# AiiDA docker base
This repository contains the Docker file that installs [AiiDA](http://www.aiida.net)
and its Python dependencies.

## Updating the image
In order to update the AiiDA version, go to Docker file and change the following line:
```
RUN pip3 install aiida-core[ ... ]==vX.Y.Z

```
Adapt X.Y.Z numbers to the latest AiiDA version.

## Docker image

The docker image contains:
 * minimal Ubuntu base image (phusion/baseimage)
 * Python 3 environment
 * user `aiida`
 * `aiida-core` and its dependencies pip-installed
 * `PYTHONPATH` (in `/home/aiida/.bashrc` points to `/home/aiida`)
 * `PATH` (in `/home/aiida/.bashrc` points to `/home/aiida/.local/bin`)

# Docker Hub repository

The docker image is built automatically on Docker Hub once new changes are pushed to the `master` or `develop` branches of this repository.
The `master` branch is available under the docker tag `latest`, while the `develop` branch is available under the docker tag `develop`.
In addition, any git tag pushed to the repository will trigger a build on Docker Hub with the same docker tag.

All the images are available following this link: https://hub.docker.com/r/aiidateam/aiida-docker-base.

# Acknowledgements

This work is supported by the [MARVEL National Centre for Competency in Research](<http://nccr-marvel.ch>)
funded by the [Swiss National Science Foundation](<http://www.snf.ch/en>), as well as by the [MaX
European Centre of Excellence](<http://www.max-centre.eu/>) funded by the Horizon 2020 EINFRA-5 program,
Grant No. 676598.

![MARVEL](miscellaneous/logos/MARVEL.png)
![MaX](miscellaneous/logos/MaX.png)
