---
layout: post
title:  "Welcome to Jekyll!"
date:   2016-09-26 12:31:11
categories:
  - jekyll
---

 Ein neues "Kopier" Projekt für jekyll Blogs. :+1:

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
