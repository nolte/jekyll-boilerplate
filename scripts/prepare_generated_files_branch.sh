#!/bin/bash
#
# Create a new Brach for the Heroku App, base on php
#
mkdir -p $HEROKU_TMP
# copy generated files to tmp folder
cp -r $(pwd)/_site/* $HEROKU_TMP

# create the tmpbrach
git branch $GENERATED_FILE_BRANCH_NAME
git checkout $GENERATED_FILE_BRANCH_NAME
# remove all existing files
rm -r $(pwd)/*
## remove invisible files
rm $(pwd)/.gitignore
rm -r $(pwd)/.sass-cache
rm -r $(pwd)/.travis.yml

# copy back the generated files
cp -r $HEROKU_TMP/* $(pwd)

# add all generated files to the branch
git add --all
git commit -am $GENERATED_FILE_BRANCH_COMMIT_MSG
