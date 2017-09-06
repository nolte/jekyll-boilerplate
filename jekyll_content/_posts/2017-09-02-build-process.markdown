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

## Heroku Container

Da sich der Blog nicht auf heroku Bauen lässt, durch die Plantuml & Ditaa Abhängigkeiten, werden nur die generierten Dateien nach Heroku übertragen.


Die [HerokuApp][Heroku-PHP-Support] wird während des TravisCI Builds mit Hilfe folgenden scriptes vorbereitet.
```
{% include prepare_heroku_deployment.sh %}
```

[Heroku-PHP-Support]:https://devcenter.heroku.com/articles/php-support
