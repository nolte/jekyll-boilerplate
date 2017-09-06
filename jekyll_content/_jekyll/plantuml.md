---
layout: jekyll_plugin
title:  "Plantuml"
links:
  jekyll_project:
    title: jekyll-plantuml
    url: https://github.com/yegor256/jekyll-plantuml
---

[Plantuml][plantuml] dient zum generieren von UML Diagram

<!--more-->


*Generated:*   
{% plantuml %}
[First] - [Second]
{% endplantuml %}

*Original:*   

```
[First] - [Second]
```

[plantuml]: {{site.data.links['plantuml'].url}}
