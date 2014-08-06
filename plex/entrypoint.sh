#!/bin/bash
set -e

sed -i 's/cd \${PLEX_MEDIA_SERVER_HOME}; su -c \"\${PLEX_MEDIA_SERVER_HOME}\/Plex\\ Media\\ Server \&\" \${PLEX_MEDIA_SERVER_USER}/cd \${PLEX_MEDIA_SERVER_HOME}; \"\${PLEX_MEDIA_SERVER_HOME}\/Plex Media Server\"/g' /opt/plexmediaserver/start_pms

exec "$@"
