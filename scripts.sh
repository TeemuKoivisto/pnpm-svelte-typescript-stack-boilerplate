#!/usr/bin/env bash

DB_HOST=localhost
DB_PORT=5600
DB_USER=pg-user
DB_PASSWORD=my-pg-password
DB_NAME=my_postgres_db

case "$1" in
  db:connect)
    psql postgresql://${DB_USER}:${DB_PASSWORD}@${DB_HOST}:${DB_PORT}/${DB_NAME}
    ;;
  *)
    echo $"Usage: $0 db:connect"
    exit 1
esac
