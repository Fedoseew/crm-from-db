#!/bin/sh
# Database crm_test for ./gradlew test, loaded from the same dump,
# so tests never change the demo data in crm.
set -e
createdb -U "$POSTGRES_USER" crm_test
psql -v ON_ERROR_STOP=1 -q -U "$POSTGRES_USER" -d crm_test -f /docker-entrypoint-initdb.d/10-crm.sql
