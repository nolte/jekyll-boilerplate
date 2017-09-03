---
layout: post
title:  "Build Process"
date:   2017-09-02 12:31:11
categories:
  - jekyll
  - build
---

{% plantuml %}
actor user
database github
control travisci
collections heroku

user -> github : commit to github
github -> travisci : build the commit
travisci -> travisci : test the generated content
travisci -> travisci : Temp deployment branch for heroku
travisci -> heroku : deploy the static content as php app
travisci -> travisci : switch back to build branch
travisci -> heroku : execute selenium tests
{% endplantuml %}
