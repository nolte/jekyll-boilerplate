---
layout: site/post
title:  "Welcome to Jekyll!"
date:   2016-09-26 12:31:11
categories:
  - jekyll
---

 Ein neues "Kopier" Projekt für jekyll Blogs. :+1:   
 zusätzlich zu dem Klassischen Bootstrap Layout wird eine [reveal.js][revealjs] Modus angeboten.
 [Reveal.js][revealjs] wird verwendet um einfache und __moderne__ Präsentationen zu erstellen.

## Addons

<table class="table table-striped">
    <thead>
      <tr>
        <th>Plugin</th>
        <th>Description</th>
      </tr>
    </thead>
    <tbody>


    {% for post in site.jekyll   %}    
      <tr>
        <td><a href="{{post.url}}">{{ post.title }}</a></td>
        <td>{{ post.excerpt }}</td>
      </tr>
    {% endfor %}
    </tbody>
  </table>


## Presentation Struktur

{% plantuml %}
 component "Presentation" as PRE
 note left of [PRE]
   Abstract Presentation Config
   <b>base layout:</b> _layouts/default.html
 end note
package "Presentation Modes" {
  component "Bootstrap4" as BOOTSTAP
  component "reveal.js" as REVEALJS

  PRE -> BOOTSTAP
  PRE -> REVEALJS

  note right of [REVEALJS]
    used for html Presentation ...
    no more PowerPoint ...
    <b>base layout:</b> _layouts/presentation/presentation.html
  end note
  note left of [BOOTSTAP]
    Classic Blog Look and Feel
    <b>base layout:</b> _layouts/site/site.html
  end note
}

{% endplantuml %}

[revealjs]:https://github.com/hakimel/reveal.js
