#!/bin/bash
set -e

chmod -R 777 /logs
chmod -R 777 /config

exec "$@"
