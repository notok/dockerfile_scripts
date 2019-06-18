#!/bin/bash
[ -f docker-compose.yml ] || { echo "docker-compose.yml not found."; exit 1; }

if [ -f ../proxy.compose.env ]; then
  source ../proxy.compose.env
fi
if [ -f compose.env ]; then
  source compose.env
fi
docker-compose down
docker-compose pull
docker-compose build
docker-compose up -d
if [ "$1" = "logs" ]; then
  docker-compose logs -f
elif [ ! "$1" = "none" ]; then
  BASEDIR=$(cd $(dirname $0); pwd)
  ${BASEDIR}/attach.sh
fi
