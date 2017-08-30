---
layout: site
title:  "ditaa"

---

[Jekyll ditaa][jekyll-ditaa]

{% ditaa %}
/----+  DAAP /-----+-----+ Audio  /--------+
| PC |<------| RPi | MPD |------->| Stereo |
+----+       +-----+-----+        +--------+
   |                 ^ ^
   |     ncmpcpp     | | mpdroid /---------+
   +--------=--------+ +----=----| Nexus S |
                                 +---------+
{% endditaa %}


[jekyll-ditaa]: https://github.com/matze/jekyll-ditaa
