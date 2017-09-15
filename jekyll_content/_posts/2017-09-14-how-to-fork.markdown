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
else
  ->[false] "remove travisci specific files"
endif

-->"<b>Build process defined!</b>"
-->"update jekyll <i>_config.yml</i>"
-->"Start the blog with <b>Docker Compose</b>"
-->[Ending process] (*)

{% endplantuml %}
