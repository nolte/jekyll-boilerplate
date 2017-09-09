#!/bin/bash
set -o errexit

# config
git config --global user.email "nobody@nobody.org"
git config --global user.name "Travis CI"

git clone --quiet --branch=gh-pages https://${GITHUB_TOKEN}@github.com/${TRAVIS_REPO_SLUG}.git $GITHUB_PAGE_DIR > /dev/null
echo "checked out"
#git clone -b gh-pages https://github.com/$TRAVIS_REPO_SLUG.git $GITHUB_PAGE_DIR
cd $GITHUB_PAGE_DIR

git rm -rf .
git clean -fxd

cp -r $GENERATED_FILE_BRANCH_DIR\/* $GITHUB_PAGE_DIR

# add all generated files to the branch
git add --all
git commit -am $GENERATED_FILE_BRANCH_COMMIT_MSG
echo "branch with generated files created"
git push -fq origin gh-pages > /dev/null 2>&1
