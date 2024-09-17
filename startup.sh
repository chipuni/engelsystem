#!/bin/sh

# Does Docker exist locally?
command -v docker > /dev/null
if [ $? -ne 0 ]; then
  echo "You need to install docker on this machine before you can install Engelsystem/FC."
fi

# Kill and remove old programs, if they are running.
docker kill engelsystem-es_server-1 engelsystem-es_database-1 2>&1 > /dev/null
docker kill engelsystem_es_server_1 engelsystem_es_database_1 2>&1 > /dev/null
docker rm engelsystem-es_server-1 engelsystem-es_database-1  2>&1 > /dev/null
docker rm engelsystem_es_server_1 engelsystem_es_database_1  2>&1 > /dev/null

# Start-up all the scripts.
# The "sleep 5" is because "--wait" doesn't wait long enough.
cd docker
docker compose build --no-cache && \
docker compose up -d && \
sleep 5 && \
docker compose exec es_server bin/migrate

if [ $? -eq 0 ]; then
  echo "The Engelsystem should now be running locally at http://localhost:80. Enjoy!"
fi
