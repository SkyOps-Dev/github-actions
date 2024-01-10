#!/bin/bash

aws ecr get-login-password --region "${1}" | docker login --username AWS --password-stdin "${2}/${3}"

docker build -f "${4}" -t "${3}:${5}" .
docker tag "${3}:${5}" "${2}:${5}"
docker push "${2}:${5}"
