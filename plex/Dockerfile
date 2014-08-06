FROM base/devel
#Update image
RUN pacman -Syu --noconfirm
#Install dependencies
RUN pacman -Su --noconfirm nano supervisor wget curl
#Install plexmediaserver
RUN curl https://aur.archlinux.org/packages/pl/plexmediaserver/plexmediaserver.tar.gz | tar zx
RUN cd plexmediaserver; makepkg -si --asroot --noconfirm

#Supervisord settings
ADD supervisord.conf /etc/supervisord.conf
ADD entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh

#Volume to store config files
VOLUME ["/opt/plexmediaserver"]
#logs container for supervisord
VOLUME ["/logs"]

EXPOSE 32400

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/supervisord", "-c","/etc/supervisord.conf"]
