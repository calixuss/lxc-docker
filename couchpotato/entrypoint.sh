#!/bin/bash
set -e
chown -R couch:couch /data
chown -R couch:couch /logs
exec "$@"
