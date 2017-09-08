#!/bin/bash
set -o errexit
echo $GENERATED_FILE_BRANCH_DIR
GITHUB_PAGE_DIR=/tmp/ghpage

# config
git config --global user.email "nobody@nobody.org"
git config --global user.name "Travis CI"


git clone -b gh-pages https://github.com/nolte/jekyll-boilerplate.git $GITHUB_PAGE_DIR

cd $GITHUB_PAGE_DIR
ls -all $GITHUB_PAGE_DIR
echo $(pwd)

git rm -rf .
git clean -fxd
echo "content after clean"
echo $(pwd)
ls -all


ls -all $GITHUB_PAGE_DIR

cp -r $GENERATED_FILE_BRANCH_DIR\/* $GITHUB_PAGE_DIR

ls -all

# add all generated files to the branch
git add --all
git commit -am $GENERATED_FILE_BRANCH_COMMIT_MSG
echo "branch with generated files created"
