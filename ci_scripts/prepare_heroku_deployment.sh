#!/bin/bash
#
# Create a new Brach for the Heroku App, base on php
#
cd $TRAVIS_BUILD_DIR
echo $(pwd)
git checkout $TRAVIS_BRANCH -- heroku_app/Procfile
git checkout $TRAVIS_BRANCH -- heroku_app/index.php
git checkout $TRAVIS_BRANCH -- heroku_app/composer.json

# move
mv heroku_app/Procfile Procfile
mv heroku_app/index.php index.php
mv heroku_app/composer.json composer.json

rm -r heroku_app

# create the tmpbrach
git branch herokuapp
git checkout herokuapp

# add all generated files to the branch
git add --all
git commit -am "add heroku specific files"
