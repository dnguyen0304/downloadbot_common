#!/usr/bin/env bash

set -eu

NAMESPACE=$1
PACKAGE_NAME=$2
SHARED_VOLUME=$3
VERSION=$4

# Set the build root to the working directory. Now relative references
# may be used.
BUILD_ROOT=$(pwd)

PACKAGE="${PACKAGE_NAME}-${VERSION}"
mkdir ${PACKAGE}

# Include the source code.
cp -r ${NAMESPACE} ${PACKAGE}

# Include the dependencies.
if [ -s requirements.txt ]; then
    pip install --requirement requirements.txt --target ${PACKAGE}
fi

# Archive the package.
cd ${PACKAGE}
zip -9qr ${PACKAGE}.zip .
cp ${PACKAGE}.zip ${PACKAGE_NAME}-latest.zip
mv ${PACKAGE_NAME}-*.zip ${SHARED_VOLUME}
