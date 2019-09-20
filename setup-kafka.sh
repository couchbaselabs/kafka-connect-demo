#!/bin/sh

set -e
set -x

################

echo "*** Downloading and expanding the Kafka Connect Couchbase distribution..."

VERSION=3.4.5

mkdir -p tmp
mkdir -p docker/couchbase-connector/tmp

curl https://packages.couchbase.com/clients/kafka/${VERSION}/kafka-connect-couchbase-${VERSION}.zip \
     > tmp/kafka-connect-couchbase-${VERSION}.zip

unzip -o tmp/kafka-connect-couchbase-${VERSION}.zip -d tmp

cp tmp/kafka-connect-couchbase-${VERSION}/kafka-connect-couchbase-${VERSION}.jar \
   docker/couchbase-connector/tmp/kafka-connect-couchbase.jar

################

echo "*** Building the custom extensions JAR..."

mvn package -f custom-extensions/pom.xml
cp custom-extensions/target/custom-extensions-1.0-SNAPSHOT.jar \
       docker/couchbase-connector/tmp/custom-extensions.jar

################

echo "*** Starting the Kafka containers..."

cd docker
docker-compose build
docker-compose up -d
