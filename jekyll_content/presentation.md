---
layout: site/site
title: Presentations
permalink: /presentation/
navigation: true
---
  {% for post in site.presentation   %}    
  * [{{post.title | prepend: site.baseurl }}]({{post.url}})
  {% endfor %}
