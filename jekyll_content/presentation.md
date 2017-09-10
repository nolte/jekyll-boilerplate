---
layout: site/site
title: Presentations
permalink: /presentation/
navigation: true
---
  {% for post in site.presentation   %}    
  * [{{post.title }}]({{post.url | prepend: site.baseurl }})
  {% endfor %}
