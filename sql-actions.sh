#!/bin/bash

#  set -ex

 echo "Pulling flyway container from GitHub registry"
 
 docker pull ghcr.io/vvvti/flyway:main > /dev/null 2>&1

 echo
 echo "Starting database operations with flyway"

 docker run --net=host --rm -v $PWD/databases/demo:/flyway/sql flyway/flyway migrate -url="$SNOWFLAKE_URL" -user="$SNOWFLAKE_USER" -password="$SNOWFLAKE_PASSWORD"

 echo "Successfully migrated sql scripts "
 echo

 