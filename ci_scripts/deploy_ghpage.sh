#!/bin/bash
set -o errexit

# config
git config --global user.email "nobody@nobody.org"
git config --global user.name "Travis CI"


git clone -b gh-pages https://github.com/nolte/jekyll-boilerplate.git /tmp/ghpage


ls -all /tmp/ghpage
