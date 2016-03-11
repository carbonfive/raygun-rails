#!/bin/sh
set -x
source "reset-config.cfg"

heroku pg:reset DATABASE_URL --confirm $ACCEPTANCE
heroku run rake db:migrate -a $ACCEPTANCE
heroku run rake db:seed db:sample_data -a $ACCEPTANCE
