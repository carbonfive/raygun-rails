#!/bin/sh
cwd=`dirname "$0"`
source "$cwd/reset-config.cfg"

echo "Loading production data in development (destructive)..."
sleep 3

DEVELOPMENT_DB="${DB_NAME}_development"

set -x

rake db:drop
heroku pg:pull DATABASE_URL $DEVELOPMENT_DB -a $PRODUCTION
