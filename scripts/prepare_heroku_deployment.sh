#!/bin/bash
#
# Create a new Brach for the Heroku App, base on php
#

mkdir -p $HEROKU_TMP
# copy generated files to tmp folder
cp -r $(pwd)/_site/* $HEROKU_TMP
# copy the tempalte index php required by Heroku
cp $(pwd)/index.php $HEROKU_TMP
# save the Procfile for web: heroku-php-apache2
cp $(pwd)/Procfile $HEROKU_TMP
# add a empty composer file
echo "{}" > $HEROKU_TMP/composer.json
# create the tmpbrach
git branch herokuapp
git checkout herokuapp
# remove all existing files
rm -r $(pwd)/*
rm $(pwd)/.gitignore
rm -r $(pwd)/.sass-cache
rm -r $(pwd)/.travis.yml

# copy back the generated files
cp -r $HEROKU_TMP/* $(pwd)

# add all generated files to the branch
git add --all
git commit -am "travisBuild"
