FROM calixuss/arch
RUN pacman -Sy --noconfirm python2 && \
    useradd -m -g wheel  makepkg-user && \
    useradd -G wheel couch && \
    echo "%wheel    ALL=(ALL) ALL" >> /etc/sudoers && \
    echo "Defaults:makepkg-user    !authenticate" >> /etc/sudoers && \
    curl https://aur.archlinux.org/packages/co/couchpotato/couchpotato.tar.gz | tar zx && \
    chmod +777 /couchpotato && \
    su -c"cd /couchpotato && makepkg -isc --noconfirm --needed" - makepkg-user && \
    userdel -r makepkg-user && \
    rm -rf /couchpotato
    pacman -Scc --noconfirm
    rm -rf /usr/share/locale/* && \
    rm -rf /usr/share/man/* && \
    rm -rf /root/* && \
    rm -rf /tmp/*

#Supervisord settings
ADD supervisord.conf /etc/supervisord.conf
ADD entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh
#Volume to store logs
VOLUME ["/logs"]
VOLUME ["/data"]

EXPOSE 5050
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/supervisord", "-c","/etc/supervisord.conf"]
