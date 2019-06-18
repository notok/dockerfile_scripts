#!/bin/bash
[ -f docker-compose.yml ] || { echo "docker-compose.yml not found."; exit 1; }

export HTTP_PROXY=
export HTTPS_PROXY=
if docker-compose exec main ls /bin/bash; then
  echo Attaching by bash.
  docker-compose exec main /bin/bash
else
  echo Bash not found. Attaching by sh.
  docker-compose exec main /bin/sh
fi
