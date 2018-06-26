FROM base/archlinux

# Main Services
RUN pacman -Suy --noconfirm openssh

# Desktop envoirnment
RUN pacman -Sy --noconfirm enlightenment
RUN pacman -Sy --noconfirm terminology

# Tools
RUN pacman -Sy --noconfirm firefox
RUN pacman -Sy --noconfirm filezilla


