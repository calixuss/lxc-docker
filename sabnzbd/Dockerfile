FROM calixuss/arch

RUN pacman -Sy --noconfirm python2-pyopenssl python2-feedparser && \
    useradd -m -g wheel  makepkg-user && \
    useradd -G wheel sabnzbd && \
    echo "%wheel    ALL=(ALL) ALL" >> /etc/sudoers && \
    echo "Defaults:makepkg-user    !authenticate" >> /etc/sudoers && \
    curl https://aur.archlinux.org/packages/sa/sabnzbd/sabnzbd.tar.gz | tar zx && \
    chmod +777 /sabnzbd && \
    su -c"cd /sabnzbd && makepkg -isc --noconfirm --needed" - makepkg-user && \
    userdel -r makepkg-user && \
    rm -rf /sabnzbd
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
VOLUME ["/config"]

EXPOSE 8080 9090
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/supervisord", "-c","/etc/supervisord.conf"]
