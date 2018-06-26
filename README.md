# docker-arch-vnc
Repository with dockerfile to create an Arch VNC server.
This docker is focused to "work" with remote envoirnment.

# IMPORTANT
This repository is under construction.

## Tools installed
OpenSSH
vim
enlightenment (Desktop envoirnment)
terminology (Terminal)
firefox
filezilla

## Build the image
```bash
git clone https://github.com/ProtocolNebula/docker-arch-vnc.git
cd docker-arch-vnc
docker build . -t arch-vnc
```

## Start docker image
```bash
docker run arch-vnc
```
