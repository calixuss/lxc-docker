#!/bin/bash
set -e
chown -R drone:drone /sonarr
chown -R drone:drone /logs
exec "$@"
