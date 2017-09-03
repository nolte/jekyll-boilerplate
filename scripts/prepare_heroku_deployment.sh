#!/bin/bash

mkdir -p $HEROKU_TMP
ls -all
cp -r $(pwd)/_site/* $HEROKU_TMP
cp $(pwd)/index.php $HEROKU_TMP
cp $(pwd)/Procfile $HEROKU_TMP
echo "{}" > $HEROKU_TMP/composer.json
git branch herokuapp
git checkout herokuapp
rm -r $(pwd)/*
cp -r $HEROKU_TMP/* $(pwd)
rm $(pwd)/.gitignore
rm -r $(pwd)/.sass-cache
rm -r $(pwd)/.travis.yml
git add --all
git commit -am "travisBuild"
