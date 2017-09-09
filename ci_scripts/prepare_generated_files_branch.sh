#!/bin/bash
#
# Create a new Brach for the Heroku App, base on php
#
mkdir -p $GENERATED_FILE_BRANCH_DIR
# copy generated files to tmp folder
cp -r $TRAVIS_BUILD_DIR/jekyll_content/_site/* $GENERATED_FILE_BRANCH_DIR

# create the tmpbrach
git branch $GENERATED_FILE_BRANCH_NAME
git checkout $GENERATED_FILE_BRANCH_NAME

# remove all existing files
rm -r $TRAVIS_BUILD_DIR\/*
## remove invisible files
rm -r $TRAVIS_BUILD_DIR\/.travis.yml

# copy back the generated files
cp -r $GENERATED_FILE_BRANCH_DIR\/* $TRAVIS_BUILD_DIR

# add all generated files to the branch
git add --all
git commit -am $GENERATED_FILE_BRANCH_COMMIT_MSG
echo "branch with generated files created"
