#!/usr/bin/env bash

docker build -f Dockerfile.root -t test-root .
docker build -f Dockerfile.pac -t test-pac .
docker build -f Dockerfile.pacman -t test-pacman .
