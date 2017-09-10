---
layout: site/post
title:  "Build Process"
date:   2017-09-02 12:31:11
categories:
  - jekyll
  - build
---

## Commit Ablauf

{% plantuml %}
actor user
database github
control travisci
collections heroku
entity slack
database keenio

user -> github : commit to github
github -> keenio : notify commit metrics
github -> travisci : build the commit
travisci -> travisci : test the generated content
travisci -> travisci : Temp deployment branch for heroku
travisci -> heroku : deploy the static content as php app
travisci -> travisci : switch back to build branch
travisci -> heroku : execute selenium tests
travisci -> slack : notify build state
travisci -> keenio : notify build metrics
slack -> user :  notify user
{% endplantuml %}

<!--more-->

Jeder build wird als Heroku App deployt, dieses dient als "DevStage".    
Nur der Master wird als [GitHub Pages][github-pages] im branch ```gh-pages``` publiziert.  
Diese Trennung wurde durch die Nutzung von [Travis-ci Built Stages][travis-ci-build-stages] erreicht.    
siehe: [![Build Status](https://travis-ci.org/nolte/jekyll-boilerplate.svg?branch=master)](https://travis-ci.org/nolte/jekyll-boilerplate)


## Heroku Container

Da sich der Blog nicht auf heroku Bauen lässt, durch die Plantuml & Ditaa Abhängigkeiten, werden nur die generierten Dateien nach Heroku übertragen.
Der Blog läuft dann als [Heroku PHP App][Heroku-PHP-Support].

## Blog Release

{% plantuml %}

actor user
database github_master
database github_feature_branch
collections heroku
database github_gh_pages

activate github_master
user -> github_master : create new\nfeature branch from master
github_master -> github_feature_branch: new Feature Branch
activate github_feature_branch
user -> github_feature_branch : commit changes
github_feature_branch -> heroku : deploy to dev stage
github_feature_branch -> github_master: reintegrate feature
deactivate github_feature_branch
github_master -> github_gh_pages : deploy to production stage

{% endplantuml %}

Der aktuell aktive **Feature Branch** ist als [Heroku App][stage-dev] einsehbar.   
Die generierte Blog version vom **Master Branche** ist unter [github.io][stage-production] zu finden.

[stage-dev]:https://noltarium-blog-test.herokuapp.com/   
[stage-production]:https://nolte.github.io/jekyll-boilerplate   

[travis-ci-build-stages]:https://docs.travis-ci.com/user/build-stages/
[github-pages]:https://pages.github.com/
[Heroku-PHP-Support]:https://devcenter.heroku.com/articles/php-support
