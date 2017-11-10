FROM python:3.6-slim

MAINTAINER Duy Nguyen <dnguyen0304@gmail.com>

ARG COMPONENT

# unzip is needed to extract the package.
ENV BUILDTIME_DEPENDENCIES="unzip"

ARG PACKAGE_DIRECTORY="/opt/${COMPONENT}"

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends ${BUILDTIME_DEPENDENCIES}

RUN useradd ${COMPONENT}

RUN mkdir ${PACKAGE_DIRECTORY}

WORKDIR ${PACKAGE_DIRECTORY}

RUN rm -fr /var/lib/apt/lists/*
