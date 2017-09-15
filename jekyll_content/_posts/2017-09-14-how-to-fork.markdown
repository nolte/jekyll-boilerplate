---
layout: site/post
title:  "How To Fork"
date:   2017-09-02 12:31:11
categories:
  - jekyll
  - build
comments: true
---


{% plantuml %}

(*) --> "Check What You Need"
if "need automatic build" then
  partition "Travis-ci.org" {
    -->[true] "configure <i>.travis.yml</i>"
      if "need complex build" then
        partition "Configure external Services" {
        -->[true] "with deployment to docker etc."
        --> ===B1===
        --> "prepare heroku create a new application"
        --> ===B2===
        ===B1=== --> "prepare hub.docker.com to\ncreate a new repository"
        --> ===B2===
        ===B1=== --> "Configure slack for notifications"
        --> ===B2===            
        --> "set travisci secrets"
        }
        -right-> "<b>Build process defined!</b>"
      else
        ->[false] "only generate the blog"
        --> "remove the stage structure from <i>.travis.yml</i>"
        -right-> "<b>Build process defined!</b>"
      endif
  }    
else
  ->[false] "remove travisci specific files"
endif

-->"<b>Build process defined!</b>"
-->"update jekyll <i>_config.yml</i>"
-->"Start the blog with <b>Docker Compose</b>"
-->"commit changes"
-->[Ending process] (*)

{% endplantuml %}

<!--more-->

## Externe Systeme

Benötigte .travis.yml anpassungen
Secrets sollten mit hilfe von [Travis-ci][travisci-encryption-keys] verschlüsselt werden.

### Deploy heroku

Auf heroku kann mit den [Travis Deployment Provier][travisci-deploy-heroku] deployt werden.

Ändern den Applikationsnamen ```- HEROKU_APP_NAME=noltarium-blog-test``` auf dass gewünschte [Heroku](https://heroku.com/) Ziel.

#### Files
```
...
├── ci_scripts
│   ├── prepare_generated_files_branch.sh
│   ├── prepare_heroku_deployment.sh
│   └── prepare_system_dependency.sh
├── heroku_app
│   ├── composer.json
│   ├── index.php
│   └── Procfile
...
```

### Deploy gh-pages

Für das Github Page Deployment wird ein [Github Api Token][github-how-to-apitoken] benötigt.
Der token wird im [Deployment Script][project-ciscript-deploy_ghpage] verwendet, und muss für die Travis Stage ```- stage: deploy as gh-page``` verfügbar sein.

```
travis encrypt GITHUB_TOKEN="Github Api Token" --add
```

#### Files
```
...
├── ci_scripts
│   ├── deploy_ghpage.sh
│   ├── prepare_generated_files_branch.sh
│   └── prepare_system_dependency.sh
...
```

### Deploy Docker Presentation

Konfiguriere den [Docker Hub][docker-hub] Account, für das [Deployment Script][project-ciscript-deploy_to_dockerhub]

```
travis encrypt DOCKER_USERNAME="Github Api Token"
travis encrypt DOCKER_PASSWORD="Github Api Token"
```

#### Files
```
...
├── ci_scripts
│   ├── deploy_to_dockerhub.sh
│   ├── prepare_docker_nginx_deployment.sh
│   ├── prepare_generated_files_branch.sh
│   └── prepare_system_dependency.sh
├── docker_nginx
│   └── Dockerfile
...
```

### Notify to Slack

 Für Benachrichtiegungen über builds kann [Slack][travisci-notifications-slack] konfiguriert werden. Dafür muss man nur die [Slack Travisci App][slack-travisci-integration] dem eigenen channel hinzugefügen.

[docker-hub]:https://hub.docker.com
[project-ciscript-deploy_ghpage]:https://github.com/nolte/jekyll-boilerplate/blob/master/ci_scripts/deploy_ghpage.sh
[project-ciscript-deploy_to_dockerhub]:https://github.com/nolte/jekyll-boilerplate/blob/master/ci_scripts/deploy_to_dockerhub.sh
[travisci-encryption-keys]:https://docs.travis-ci.com/user/encryption-keys/
[travisci-notifications-slack]:https://docs.travis-ci.com/user/notifications/#Configuring-slack-notifications
[travisci-deploy-heroku]:https://docs.travis-ci.com/user/deployment/heroku/
[slack-travisci-integration]:https://slack.com/apps/A0F81FP4N-travis-ci#panel_more_info
[github-how-to-apitoken]:https://github.com/blog/1509-personal-api-tokens
