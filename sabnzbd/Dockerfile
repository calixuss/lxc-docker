FROM base/devel
#Update image
RUN pacman -Syu --noconfirm
#Install dependencies
RUN pacman -Su --noconfirm nano supervisor wget curl
#Install nzbdrone from aur
RUN curl https://aur.archlinux.org/packages/sa/sabnzbd/sabnzbd.tar.gz | tar zx
RUN cd sabnzbd; makepkg -si --asroot --noconfirm

#Supervisord settings
ADD supervisord.conf /etc/supervisord.conf

#Volume to store logs
VOLUME ["/logs"]

EXPOSE 8989
#CMD ["/usr/bin/supervisord"]
