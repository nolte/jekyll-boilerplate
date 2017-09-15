#!/bin/bash
#
# Create a new Brach for the Heroku App, base on php
#
cd $TRAVIS_BUILD_DIR
echo $(pwd)
git checkout $TRAVIS_BRANCH -- docker_nginx/Dockerfile

# move
mv  docker_nginx/Dockerfile Dockerfile

rm -r docker_nginx

# create the tmpbrach
git branch dockernginx
git checkout dockernginx

# add all generated files to the branch
git add --all
git commit -am "add dockernginx specific files"
