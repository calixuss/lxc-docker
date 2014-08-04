FROM base/devel
#Update image
RUN pacman -Syu --noconfirm
#Install dependencies
RUN pacman -Su --noconfirm nano supervisor wget curl
#Install nzbdrone from aur
RUN curl https://aur.archlinux.org/packages/nz/nzbdrone/nzbdrone.tar.gz | tar zx
RUN cd nzbdrone; makepkg -si --asroot --noconfirm
RUN useradd -G wheel drone
#Supervisord settings
ADD supervisord.conf /etc/supervisord.conf
ADD entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh
#Volume to store logs
VOLUME ["/logs"]
#volume to store app settings in /home/drone/.config/Nzbdrone
VOLUME ["/home/drone"]

EXPOSE 8989
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/supervisord"]
