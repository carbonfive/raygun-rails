#!/bin/sh -e

if [ $# -ne 1 ]; then
  echo 1>&2 "Usage: $0 <application name>"
  exit 1
fi

APP_NAME=$1

if [ -n "$CIRCLE_SHA1" ]; then
  SHA_TO_DEPLOY=$CIRCLE_SHA1
else
  echo "CIRCLE_SHA1 isn't set, deploying the latest revision."
  SHA_TO_DEPLOY=`git rev-parse HEAD`
fi

REMOTE_MISSING=$(git remote | grep heroku | wc -l)

if [ $REMOTE_MISSING -eq 0 ] ; then
  git remote add heroku git@heroku.com:$APP_NAME.git
fi

# CircleCI makes a shallow clone to reduce network bandwidth. Pushing from a
# shallow clone often works, but it can fail since shallow clones don't have
# the full history. The error message looks like:
#   ! [remote rejected] ... (missing necessary objects)
# The following converts the repo to a complete one (git fetch --unshallow)
# if it is shallow (i.e. the file ".git/shallow" exists)
[ ! -s "$(git rev-parse --git-dir)/shallow" ] || git fetch --unshallow

git push -f heroku $SHA_TO_DEPLOY:refs/heads/master
