FROM base/devel
#Update image
RUN pacman -Syu --noconfirm
#Install dependencies
RUN pacman -Su --noconfirm nano supervisor wget curl python2-pyopenssl python2-feedparser
#Install nzbdrone from aur
RUN curl https://aur.archlinux.org/packages/sa/sabnzbd/sabnzbd.tar.gz | tar zx
RUN cd sabnzbd; makepkg -si --asroot --noconfirm

RUN useradd sabnzbuser

#Supervisord settings
ADD supervisord.conf /etc/supervisord.conf
ADD entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh
#Volume to store logs
VOLUME ["/logs"]
VOLUME ["/config"]

EXPOSE 8080 9090
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/supervisord", "-c","/etc/supervisord.conf"]
