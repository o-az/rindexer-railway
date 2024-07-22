# syntax = docker/dockerfile:1
FROM ghcr.io/o-az/rindexer-dev:main

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ARG DEBIAN_FRONTEND="noninteractive"
ARG DEBCONF_NOWARNINGS="yes"
ARG DEBCONF_TERSE="yes"
ARG LANG="C.UTF-8"

WORKDIR /app

ARG PROJECT_PATH="./rindexer"

COPY ${PROJECT_PATH} ${PROJECT_PATH}

COPY ./scripts/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
