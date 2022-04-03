#!/bin/bash

export VERSION=${1:latest}

echo -e "Creating a new builder instance"
docker buildx create --name mybuilder-${VERSION} --use
echo -e "Booting builder"
docker buildx inspect --bootstrap --builder mybuilder-${VERSION}
echo -e "Docker build and push"
docker buildx build --platform linux/amd64,linux/arm64 --tag siriuszg/cmak:${VERSION} --push .
echo -e "Removing builder"
docker buildx rm mybuilder-${VERSION}
