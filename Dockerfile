FROM base/archlinux

# Exposed ports
# OpenSSH
EXPOSE 22

# Main configuration
RUN useradd -ms /bin/bash arch -p test

# Main Services
RUN pacman -Suy --noconfirm openssh

# Desktop envoirnment
#RUN pacman -Sy --noconfirm enlightenment
#RUN pacman -Sy --noconfirm terminology

# Tools
#RUN pacman -Sy --noconfirm firefox
#RUN pacman -Sy --noconfirm filezilla
RUN pacman -Sy --noconfirm vim

# Configuring SSH
#RUN echo "Port 22" >> /etc/ssh/sshd_config 
#RUN echo "AllowUsers arch" >> /etc/ssh/sshd_config 
#RUN echo "ListenAddress ::" >> /etc/ssh/sshd_config 

COPY copy/etc/ssh/sshd_config /etc/ssh/sshd_config
COPY copy/home/arch/start.sh /home/arch/start.sh

#RUN chmod 777 /home/arch/start.sh

#CMD /home/arch/start.sh
 
