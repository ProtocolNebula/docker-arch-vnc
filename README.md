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

# Mount docker

## Build the image
```bash
git clone https://github.com/ProtocolNebula/docker-arch-vnc.git
cd docker-arch-vnc
docker build . -t arch-vnc
```

**TIP:** add ```--no-cache``` if required

## Start docker image
Change ```5099``` with you disred SSH port

### Normal mode Without SSH (detached and non-remove on close)
```bash
docker run -dp 5901:5091 --name arch-vnc arch-vnc:latest
```

### Normal mode With SSH (detached and non-remove on close)
```bash
docker run -dp 5099:22 --name arch-vnc arch-vnc:latest
```

**Connect address:** IP_OR_DOMAIN:5901

In this mode you need to connect with an ssh client to map the port:
```bash
ssh docker@IP_OR_DOMAIN -p 5099 -L 5901:IP_OR_DOMAIN:5901
```

**Connect address:** localhost:5901

### Testing (Attatched mode and remove on close)
```bash
docker run --rm -it -p 5099:22 --name arch-vnc arch-vnc:latest
```

## Close (use kill if freeze)
```bash
docker stop arch-vnc
```


# Using the docker

## Connect via ssh
*Change 5099 for your port*
```bash
ssh docker@127.0.0.1 -p 5099
```

*Default pwd:* docker

If SSH hosts fail, edit manually ```vim ~/.ssh/known_hosts```


# Special thanks

Main SSH Configuration Dockerfile: https://github.com/retorillo/archlinux-sshd/blob/master/Dockerfile

