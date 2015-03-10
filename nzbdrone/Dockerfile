FROM calixuss/arch
RUN useradd -m -g wheel -u 1001 makepkg-user && \
    useradd -G wheel -u 1000 drone && \
    echo "%wheel    ALL=(ALL) ALL" >> /etc/sudoers && \
    echo "Defaults:makepkg-user    !authenticate" >> /etc/sudoers && \
    curl https://aur.archlinux.org/packages/so/sonarr/sonarr.tar.gz | tar xz && \
    chmod +777 -R /sonarr && \
    pacman -Sy --noconfirm && \
    su -c"cd /sonarr && makepkg -isc --noconfirm --needed" - makepkg-user && \
    userdel -r makepkg-user && \
    rm -rf /sonarr && \
    pacman -Scc --noconfirm && \
    rm -rf /usr/share/locale/* && \
    rm -rf /usr/share/man/* && \
    rm -rf /root/* && \
    rm -rf /tmp/*


VOLUME ["/sonarr"]
VOLUME ["/logs"]

#Supervisord settings
ADD supervisord.conf /etc/supervisord.conf
ADD entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh


EXPOSE 8989
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/supervisord", "-c","/etc/supervisord.conf"]
