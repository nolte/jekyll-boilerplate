#!/bin/bash
set -o errexit
GITHUB_PAGE_DIR=/tmp/ghpage

# config
git config --global user.email "nobody@nobody.org"
git config --global user.name "Travis CI"


git clone -b gh-pages https://github.com/$TRAVIS_REPO_SLUG.git $GITHUB_PAGE_DIR
cd $GITHUB_PAGE_DIR

git rm -rf .
git clean -fxd

cp -r $GENERATED_FILE_BRANCH_DIR\/* $GITHUB_PAGE_DIR

# add all generated files to the branch
git add --all
git commit -am $GENERATED_FILE_BRANCH_COMMIT_MSG
echo "branch with generated files created"
git push --force --quiet "https://${GITHUB_TOKEN}@$github.com/${TRAVIS_REPO_SLUG}.git" master:gh-pages > /dev/null 2>&1
