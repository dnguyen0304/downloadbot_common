#!/usr/bin/env bash

set -eu

COMPONENT=$(./scripts/get-package-name.sh)
TAG=$(./scripts/get-package-version.sh)

docker build \
    --file docker/runtime/base/Dockerfile \
    --tag dnguyen0304/${COMPONENT}-runtime-base:${TAG} \
    --build-arg COMPONENT=${COMPONENT} \
    .
