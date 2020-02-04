FROM python:alpine

COPY . /electrumx

RUN mkdir -p /var/db/electrumx && \
    apk add --no-cache git build-base openssl && \
    apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/main leveldb leveldb-dev && \
    cd electrumx && \
    rm -rf .git && \
    python setup.py install && \
    apk del git build-base leveldb-dev && \
    rm -rf /tmp/*

WORKDIR /electrumx

ENTRYPOINT /electrumx/electrumx_server
