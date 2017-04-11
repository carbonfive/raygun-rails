#!/bin/sh
cwd=`dirname "$0"`
source "$cwd/reset-config.cfg"

echo "Copying production data to acceptance (destructive)..."
sleep 3

set -x

heroku pg:copy $PRODUCTION::DATABASE_URL DATABASE_URL --confirm $ACCEPTANCE
