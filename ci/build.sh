#!/bin/bash

source .env

docker build \
    --build-arg PCRE_VERSION \
    --build-arg ZLIB_VERSION \
    --build-arg OPENSSL_VERSION \
    --build-arg NGINX_VERSION \
    -t refractix/nginx-stream \
    .