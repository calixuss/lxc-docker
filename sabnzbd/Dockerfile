FROM base/devel
#Update image
RUN pacman -Syu --noconfirm && \
    pacman-db-upgrade  && \
    pacman -Su --noconfirm supervisor python2-pyopenssl python2-feedparser && \
    useradd  sabnzbuser && \
    useradd -m -g wheel  makepkg-user && \
    echo "%wheel    ALL=(ALL) ALL" >> /etc/sudoers && \
    echo "Defaults:makepkg-user    !authenticate" >> /etc/sudoers && \
    curl https://aur.archlinux.org/packages/sa/sabnzbd/sabnzbd.tar.gz | tar zx && \
    chmod +777 /sabnzbd && \
    su -c"cd /sabnzbd && makepkg -isc --noconfirm --needed" - makepkg-user && \
    userdel -r makepkg-user && \
    rm -rf /sabnzbd


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
