#!/bin/bash
set -o errexit

docker build .
docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
docker build -t jekyll-boilerplate .
docker tag travis-ci-build-stages-demo $DOCKER_USERNAME/jekyll-boilerplate
docker push $DOCKER_USERNAME/jekyll-boilerplate
