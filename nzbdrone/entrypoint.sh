#!/bin/bash
set -e

chmod -R 777 /logs

chown -R drone:drone /home/drone
exec "$@"
