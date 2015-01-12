FROM base/devel:latest
RUN pacman -Syu --noconfirm && \
    pacman-db-upgrade  && \
    pacman -Su --noconfirm supervisor && \
    useradd  nzbdrone && \
    useradd -m -g wheel  makepkg-user && \
    echo "%wheel    ALL=(ALL) ALL" >> /etc/sudoers && \
    echo "Defaults:makepkg-user    !authenticate" >> /etc/sudoers && \
    curl https://aur.archlinux.org/packages/so/sonarr/sonarr.tar.gz | tar xz && \
    chmod +777 -R /sonarr && \
    su -c"cd /sonarr && makepkg -isc --noconfirm --needed" - makepkg-user && \
    userdel -r makepkg-user && \
    rm -rf /sonarr


VOLUME ["/home/nzbdrone"]


#Supervisord settings
ADD supervisord.conf /etc/supervisord.conf
ADD entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh


EXPOSE 8989
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/supervisord", "-c","/etc/supervisord.conf"]
