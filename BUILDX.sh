#!/bin/bash

TAGS=""

while (( $# )); do
  TAGS="$TAGS --tag ghcr.io/thorsten-l/mailhog:$1"
  TAGS="$TAGS --tag tludewig/mailhog:$1"
  shift
done

BUILDING_TAGS=$(echo $TAGS | tr ' ' "\n")

docker buildx build --progress plain --no-cache \
  --push \
  --platform linux/arm64,linux/amd64,linux/arm/v7 $BUILDING_TAGS .
