#!/bin/sh

set -x

docker-compose -f docker/docker-compose.yml down -v

docker stop couchbase-connect-demo
docker rm couchbase-connect-demo

docker network rm connect-demo
