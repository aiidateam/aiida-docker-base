# AiiDA docker base
This repository contains the Docker file that installs only [AiiDA](http://www.aiida.net)
and its Python dependencies.

## Updating the image
In order to update the AiiDA version, go to Docker file and change the following line:
```
RUN pip3 install aiida-core[ ... ]==vX.Y.Z

```
Adapt X.Y.Z numbers to the latest AiiDA version
```
./build.sh
./tag.sh # to add the version number as the image's tag
./push.sh # to push the image tagged with version number
./push_latest.sh # to push the image tagged with 'latest'
```

## Acknowledgements

This work is supported by the [MARVEL National Centre for Competency in Research](<http://nccr-marvel.ch>)
funded by the [Swiss National Science Foundation](<http://www.snf.ch/en>), as well as by the [MaX
European Centre of Excellence](<http://www.max-centre.eu/>) funded by the Horizon 2020 EINFRA-5 program,
Grant No. 676598.

![MARVEL](miscellaneous/logos/MARVEL.png)
![MaX](miscellaneous/logos/MaX.png)
