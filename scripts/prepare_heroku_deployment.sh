#!/bin/bash
#
# Create a new Brach for the Heroku App, base on php
#

git checkout $TRAVIS_BRANCH -- Procfile
git checkout $TRAVIS_BRANCH -- index.php
echo "{}" > composer.json

# create the tmpbrach
git branch herokuapp
git checkout herokuapp

# add all generated files to the branch
git add --all
git commit -am "add heroku specific files"
