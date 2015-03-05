FROM codekoala/arch:latest

RUN pacman -Sy --noconfirm && \	    
    pacman -S pacman --noconfirm && \
    pacman-db-upgrade && \
    pacman -Syu --ignore filesystem --noconfirm && \
    pacman -S base-devel supervisor --noconfirm && \
    pacman -Scc --noconfirm
    rm -rf /usr/share/locale/* && \
    rm -rf /usr/share/man/* && \
    rm -rf /root/* && \
    rm -rf /tmp/*
