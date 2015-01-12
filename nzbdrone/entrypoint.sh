#!/bin/bash
set -e
chown -R nzbdrone:nzbdrone /home/nzbdrone
exec "$@"
