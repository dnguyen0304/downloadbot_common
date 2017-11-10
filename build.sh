#!/usr/bin/env bash

set -eu

if [ "${1:-}" = test ]; then
    for_testing="true"
else
    for_testing="false"
fi

DOMAIN="dnguyen0304"
NAMESPACE="downloadbot"
PACKAGE_NAME=$(./scripts/get-package-name.sh)
VERSION=$(./scripts/get-package-version.sh)
REMOTE_SHARED_VOLUME="/tmp/build"

# Clean up existing packages created by previous builds.
rm --force ${PACKAGE_NAME}*.zip

# Create the buildtime container.
BUILDTIME_BASE_IMAGE_VERSION="0.1.0"
tag=${DOMAIN}/${PACKAGE_NAME}-buildtime:${VERSION}

if [ ! -z $(sudo docker images --quiet ${tag}) ]; then
    docker rmi --force ${tag}
fi
docker build \
    --file docker/buildtime/Dockerfile \
    --tag ${tag} \
    --build-arg DOMAIN=${DOMAIN} \
    --build-arg NAMESPACE=${NAMESPACE} \
    --build-arg BASE_IMAGE_VERSION=${BUILDTIME_BASE_IMAGE_VERSION} \
    --build-arg NAMESPACE=${NAMESPACE} \
    .

# Create the package.
docker run \
    --rm \
    --volume $(pwd):${REMOTE_SHARED_VOLUME} \
    ${tag} \
    ${NAMESPACE} ${PACKAGE_NAME} ${REMOTE_SHARED_VOLUME} ${VERSION}

# Create the container.
RUNTIME_BASE_IMAGE_VERSION="0.1.0"
tag=${DOMAIN}/${PACKAGE_NAME}-runtime:${VERSION}

if [ ! -z $(sudo docker images --quiet ${tag}) ]; then
    docker rmi --force ${tag}
fi
docker build \
    --file docker/runtime/Dockerfile \
    --tag ${tag} \
    --build-arg DOMAIN=${DOMAIN} \
    --build-arg NAMESPACE=${PACKAGE_NAME} \
    --build-arg BASE_IMAGE_VERSION=${RUNTIME_BASE_IMAGE_VERSION} \
    --build-arg PACKAGE_NAME=${PACKAGE_NAME} \
    .

if [ "${for_testing}" = true ]; then
    # This must pass the NAMESPACE build argument twice. See the
    # documentation for more details.
    # https://docs.docker.com/engine/reference/builder/#understand-how-arg-and-from-interact
    docker build \
        --file docker/runtime/testing/Dockerfile \
        --tag ${tag} \
        --build-arg DOMAIN=${DOMAIN} \
        --build-arg NAMESPACE=${PACKAGE_NAME} \
        --build-arg BASE_IMAGE_VERSION=${RUNTIME_BASE_IMAGE_VERSION} \
        .
fi
