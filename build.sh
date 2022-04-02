#!/bin/bash

export VERSION=${1:latest}

echo -e ">>>>>>>> docker build linux/amd64 <<<<<<<<"
docker buildx build --platform linux/amd64 -t siriuszg/cmak:${VERSION}-amd64 .

echo -e ">>>>>>>> docker build linux/arm64 <<<<<<<<"
docker buildx build --platform linux/arm64 -t siriuszg/cmak:${VERSION}-arm64 .

# echo -e ">>>>>>>> docker push <<<<<<<<"
docker push siriuszg/cmak:${VERSION}-amd64
docker push siriuszg/cmak:${VERSION}-arm64

echo -e ">>>>>>>> docker manifest create <<<<<<<<"
docker manifest create siriuszg/cmak:${VERSION} \
    siriuszg/cmak:${VERSION}-amd64 \
    siriuszg/cmak:${VERSION}-arm64

echo -e ">>>>>>>> docker manifest push <<<<<<<<"
docker manifest push siriuszg/cmak:${VERSION}

# echo -e ">>>>>>>> docker manifest annotate <<<<<<<<"
# docker manifest annotate siriuszg/cmak:${VERSION} siriuszg/cmak:${VERSION}-arm64 --arch arm64
