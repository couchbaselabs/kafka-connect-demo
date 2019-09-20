#!/bin/sh

set -e
set -x

mkdir -p tmp
cd tmp

git clone https://github.com/Landoop/kafka-connect-tools.git
cd kafka-connect-tools
git checkout 1.0.6
./gradlew buildCli
