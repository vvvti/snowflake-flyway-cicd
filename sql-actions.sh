#!/bin/bash

 set -e

 echo "Pulling flyway container..."
 
 docker pull flyway/flyway > /dev/null 2>&1

 echo
 echo "Starting database operations with flyway"

 docker run --net=host --rm -v $PWD/sql:/flyway/sql flyway/flyway migrate -url=$SNOWFLAKE_URL -user=$SNOWFLAKE_USER -password=$SNOWFLAKE_UPASSWORD

 echo "Successfully migrated sql scripts "
 echo

 