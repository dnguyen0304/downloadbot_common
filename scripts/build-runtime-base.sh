#!/usr/bin/env bash

set -eu

PACKAGE_NAME=$(./scripts/get-package-name.sh)
TAG=$(./scripts/get-package-version.sh)

docker build \
    --file docker/runtime/base/Dockerfile \
    --tag dnguyen0304/${PACKAGE_NAME}-runtime-base:${TAG} \
    --build-arg PACKAGE_NAME=${PACKAGE_NAME} \
    .
