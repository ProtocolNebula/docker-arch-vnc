FROM base/archlinux

# Thanks to:
#  SSHD: https://github.com/retorillo/archlinux-sshd/blob/master/Dockerfile 

#
# INSTALLATIONS
#

# Main Services
RUN pacman -Sy --needed --noconfirm \
  sudo vim sed openssh xorg xorg-xauth xorg-xinit git tigervnc 

# Other interesting tools (add to pacman)
# which tar grep awk wget 

# Desktop environment
RUN pacman -Sc --needed --noconfirm \
    sudo enlightenment terminology

# Tools
RUN pacman -Sc --needed --noconfirm \
    sudo firefox filezilla

# Clean pacman packages
RUN pacman -Sc --noconfirm

# CMD /home/arch/start.sh

#
# CONFIGURATIONS
#

# Configuring locale
ENV EDITOR='vim'
RUN sed -ie 's/^#\(en_US\.UTF-8 UTF-8\)/\1/' /etc/locale.gen \
  && locale-gen

# Users creation/allowing access (create the users you need here)
RUN useradd -mU -s /bin/bash docker && echo 'docker:docker' | chpasswd
RUN echo "docker ALL=(ALL:ALL) ALL" | (EDITOR="tee -a" visudo)
RUN echo "AllowUsers docker" >> /etc/ssh/sshd_config

# Enable X11 forwarding
RUN echo "X11Forwarding yes" >> /etc/ssh/sshd_config

# Exposing ports
EXPOSE 22

# Start fix ssh keys
CMD [ ! -f /etc/ssh/ssh_host_rsa_key ] && ssh-keygen -A; /bin/sshd -D
