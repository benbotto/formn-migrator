#!/bin/bash

if [ "$#" -ne 2 ]
then
  echo "Usage: $0 <tag> <formn-cli-version>"
  exit 1
fi

TAG=$1
FORMN_CLI_VERSION=$2

# Build and push latest.
docker build \
  --build-arg TAG="${TAG}" \
  --build-arg FORMN_CLI_VERSION="${FORMN_CLI_VERSION}" \
  -t avejidah/formn-migrator:latest \
  .

docker push avejidah/formn-migrator:latest

# Tag and push.
docker tag \
  avejidah/formn-migrator:latest \
  avejidah/formn-migrator:${TAG}

docker push avejidah/formn-migrator:${TAG}

