#!/bin/bash
set -o errexit

# config
git config --global user.email "nobody@nobody.org"
git config --global user.name "Travis CI"


git clone -b gh-pages git@github.com:$TRAVIS_REPO_SLUG.git /tmp/ghpage


ls -all
