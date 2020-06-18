#!/usr/bin/env bash

echo -e "\n\n TEST 1 \n\n"

mkdir -p files

sudo rm files/FILE
echo create files as root
docker run -v "$(pwd)"/files:/opt/files test-root touch /opt/files/FILE
echo chowning root:root files as pac
docker run -v "$(pwd)"/files:/opt/files test-pac chown -R 1001:1001 /opt/files/FILE && echo "SUCCESS"
echo chowning root:root files as pacman
docker run -v "$(pwd)"/files:/opt/files test-pacman chown -R 1001:1001 /opt/files/FILE && echo "SUCCESS"
echo chowning root:root files as root
docker run -v "$(pwd)"/files:/opt/files test-root chown -R 1001:1001 /opt/files/FILE && echo "SUCCESS"

echo -e "\n\n TEST 2 \n\n"

sudo rm files/FILE
echo create files as pac
docker run -v "$(pwd)"/files:/opt/files test-pac touch /opt/files/FILE
echo chowning pac:pac files as pac
docker run -v "$(pwd)"/files:/opt/files test-pac chown -R 1001:1001 /opt/files/FILE && echo "SUCCESS"
echo chowning pac:pac files as pacman
docker run -v "$(pwd)"/files:/opt/files test-pacman chown -R 1001:1001 /opt/files/FILE && echo "SUCCESS"
echo chowning pac:pac files as root
docker run -v "$(pwd)"/files:/opt/files test-root chown -R 1001:1001 /opt/files/FILE && echo "SUCCESS"

echo -e "\n\n TEST 3 \n\n"

sudo rm files/FILE
echo create files as pac
docker run --user 1001:1001 -v "$(pwd)"/files:/opt/files test-pac touch /opt/files/FILE
echo chowning pac:pac files as pac
docker run -v "$(pwd)"/files:/opt/files test-pac chown -R 1001:1001 /opt/files/FILE && echo "SUCCESS"
echo chowning pac:pac files as pacman
docker run -v "$(pwd)"/files:/opt/files test-pacman chown -R 1001:1001 /opt/files/FILE && echo "SUCCESS"
echo chowning pac:pac files as root
docker run -v "$(pwd)"/files:/opt/files test-root chown -R 1001:1001 /opt/files/FILE && echo "SUCCESS"

echo -e "\n\n TEST 4 \n\n"

sudo rm files/FILE
echo create files as pacman
docker run -v "$(pwd)"/files:/opt/files test-pacman touch /opt/files/FILE
echo chowning pacman:pacman files as pac
docker run -v "$(pwd)"/files:/opt/files test-pac chown -R 1001:1001 /opt/files/FILE && echo "SUCCESS"
echo chowning pacman:pacman files as pacman
docker run -v "$(pwd)"/files:/opt/files test-pacman chown -R 1001:1001 /opt/files/FILE && echo "SUCCESS"
echo chowning pacman:pacman files as root
docker run -v "$(pwd)"/files:/opt/files test-root chown -R 1001:1001 /opt/files/FILE && echo "SUCCESS"
