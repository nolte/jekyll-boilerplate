---
layout: site/post
title:  "Build Process"
date:   2017-09-02 12:31:11
categories:
  - jekyll
  - build
comments: true
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
skinparam ParticipantPadding 20
skinparam BoxPadding 10

actor user

box "GitHub Branches" #LightGreen
  database "master" as github_master
  database "development" as github_development
  database "feature" as github_feature_branch
end box

box "Presentation" #LightBlue
  collections heroku
  database dockerhub
  database github_gh_pages
end box

activate github_master
...
github_master -> github_development
activate github_development
github_development -> github_feature_branch: new Feature Branch
activate github_feature_branch
note right
  Develop only in featues
end note
user -> github_feature_branch : commit changes
github_feature_branch -> heroku : deploy commit
note right
  use heroku for quick
  feedback, of the
  current feature  
end note
github_feature_branch -> github_development: reintegrate feature
note left
  Merge the feature as GitPull request
end note
deactivate github_feature_branch
github_development -> dockerhub : as version **:development**
note right
  deploy a nginx container
  with the genearted content
end note
github_development -> github_master
github_master -> github_gh_pages : deploy to production stage
note right
  production view
end note
github_master -> dockerhub : as version **:latest**

{% endplantuml %}

Der aktuell aktive **Feature Branch** ist als [Heroku App][stage-dev] einsehbar.   
Die generierte Blog Version vom **Master Branche** ist unter [github.io][stage-production] zu finden.

Sollte man den generierten Blog lokal starten wollen kann ein [Nginx Container][stage-dockerhub] verwendet werden.

```
  docker run -p 8080:80 nolte/jekyll-boilerplate
```

[stage-dev]:https://noltarium-blog-test.herokuapp.com/   
[stage-production]:https://nolte.github.io/jekyll-boilerplate   
[stage-dockerhub]:https://hub.docker.com/r/nolte/jekyll-boilerplate


[travis-ci-build-stages]:https://docs.travis-ci.com/user/build-stages/
[github-pages]:https://pages.github.com/
[Heroku-PHP-Support]:https://devcenter.heroku.com/articles/php-support
