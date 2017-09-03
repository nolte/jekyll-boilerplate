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


user -> github : commit to github
github -> travisci : build the commit
travisci -> travisci : test the generated content
travisci -> travisci : Temp deployment branch for heroku
travisci -> heroku : deploy the static content as php app
travisci -> travisci : switch back to build branch
travisci -> heroku : execute selenium tests
travisci -> slack : notify build state
slack -> user :  notify user
{% endplantuml %}


## Heroku Container

Da sich der Blog nicht auf heroku Bauen lässt, durch die Plantuml & Ditaa Abhängigkeiten, werden nur die Generierten Dateien nach Heroku übertragen.
Die

```
{% include prepare_heroku_deployment.sh %}
```

[Heroku-PHP-Support]:https://devcenter.heroku.com/articles/php-support
