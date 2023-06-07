#!/usr/bin/env bash

set -eu

which buf || (echo 'Missing buf binary. Run `make init`'; exit 1)

cd "$(dirname $0)/grpc-gateway"

cp ../buf.gen.yaml ./
buf generate

touch ../gen/protoc_gen_openapiv2/__init__.py
touch ../gen/protoc_gen_openapiv2/options/__init__.py

git restore buf.gen.yaml
