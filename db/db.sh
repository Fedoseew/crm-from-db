#!/bin/sh
# The crm-from-db PostgreSQL (db/docker-compose.yml), used by the IntelliJ run configurations in .run/.
#   db/db.sh up     start it and wait until it is healthy; on an empty volume, that is after db/crm.sql is loaded
#   db/db.sh reset  delete the volume (CRM tables, the app's own tables, users) and start again from db/crm.sql
set -eu
# IDEA started from the Dock may not have the Docker CLI on its PATH.
PATH="$PATH:/opt/homebrew/bin:/usr/local/bin"
cd "$(dirname "$0")"
case "${1:-}" in
  up) ;;
  reset)
    if lsof -nP -iTCP:8080 -sTCP:LISTEN >/dev/null 2>&1; then
      echo "an app is running on :8080: stop \"crm-from-db app\" first, then reset" >&2
      exit 1
    fi
    docker compose down -v ;;
  *) echo "use: db/db.sh up|reset" >&2; exit 2 ;;
esac
docker compose up -d --wait db
# The dump goes only into an empty volume: a volume whose CRM tables were dropped stays without them.
n=$(docker compose exec -T db psql -tA -U crm -d crm -c "select count(*) from information_schema.tables
  where table_schema = 'public' and table_name in
  ('client', 'contact', 'category', 'category_item', 'order_', 'order_item', 'invoice', 'user_')")
if [ "$n" != 8 ]; then
  echo "the database has ${n:-none} of the 8 CRM tables of db/crm.sql: run \"crm-from-db database reset\"" >&2
  exit 1
fi
echo "crm-from-db database: localhost:5434, database crm, user crm / crm, 8 CRM tables"
if [ "$1" = reset ]; then
  echo "next: start \"crm-from-db app\" once, then Users > Create: sales / sales, no roles"
fi
