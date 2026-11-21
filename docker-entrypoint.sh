#!/bin/sh
set -eu

# Si se proporcionan variables genéricas DB_URL / DB_USERNAME / DB_PASSWORD desde AWS Secrets Manager,
# las mapeamos a USERS_DB_URL / USERS_DB_USERNAME / USERS_DB_PASSWORD
if [ -n "${DB_URL:-}" ] && [ -z "${USERS_DB_URL:-}" ]; then
  export USERS_DB_URL="$DB_URL"
fi
if [ -n "${DB_USERNAME:-}" ] && [ -z "${USERS_DB_USERNAME:-}" ]; then
  export USERS_DB_USERNAME="$DB_USERNAME"
fi
if [ -n "${DB_PASSWORD:-}" ] && [ -z "${USERS_DB_PASSWORD:-}" ]; then
  export USERS_DB_PASSWORD="$DB_PASSWORD"
fi

exec java -jar /app/app.jar
