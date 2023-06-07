#!/usr/bin/env bash

set -eu

VERSION=$1

cd $(dirname $0)

cd grpc-gateway/
git remote update -p
git checkout v$VERSION
git status
cd ..

sed -i '' -e "s/^version =.*/version = $VERSION/" setup.cfg
