---
layout: jekyll_plugin
title: ditaa
links:
  jekyll_project:
    title: jekyll-ditaa
    url: https://github.com/matze/jekyll-ditaa
---

[Ditaa][jekyll-ditaa] ist eine nette Möglichkeit einfach Diagramme als markdown zu speichern.   
Durch [asciiflow.com][asciiflow] lassen sich die Diagramme recht einfach erstellen.

<!--more-->

*Generated:*   
{% ditaa %}
/----+  DAAP /-----+-----+ Audio  /--------+
| PC |<------| RPi | MPD |------->| Stereo |
+----+       +-----+-----+        +--------+
   |                 ^ ^
   |     ncmpcpp     | | mpdroid /---------+
   +--------=--------+ +----=----| Nexus S |
                                 +---------+
{% endditaa %}


*Original:*   
```
/----+  DAAP /-----+-----+ Audio  /--------+
| PC |<------| RPi | MPD |------->| Stereo |
+----+       +-----+-----+        +--------+
   |                 ^ ^
   |     ncmpcpp     | | mpdroid /---------+
   +--------=--------+ +----=----| Nexus S |
                                 +---------+
```


[jekyll-ditaa]: {{site.data.links['ditaa'].url}}
[asciiflow]: {{site.data.links['asciiflow'].url}}
