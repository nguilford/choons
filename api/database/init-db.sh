#!/usr/bin/env bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mysql -h"${CHOONS_API_DATABASE_HOST}" -P"${CHOONS_API_DATABASE_PORT:-3306}" -u"${CHOONS_API_DATABASE_USER}" -p"${CHOONS_API_DATABASE_PASSWORD}" "${CHOONS_API_DATABASE_NAME}" < "${script_dir}/choons.sql"
