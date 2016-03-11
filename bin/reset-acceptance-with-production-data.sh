#!/bin/sh
set -x
source "reset-config.cfg"

heroku pg:copy $PRODUCTION::DATABASE_URL DATABASE_URL --confirm $ACCEPTANCE
