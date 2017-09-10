---
title: Reveal.js
---

<div class="reveal">
			<div class="slides">
      <section>
        <h1>{{page.title}}</h1>
        <h3>The HTML Presentation Framework</h3>
        <h4>integrate in jekyll</h4>
        <p>
          {% if site.github_username %}<small>Created by <a href="{{ site.baseurl }}/">{{site.github_username}}</a> / {% include icon-github.html username=site.github_username %}</small>{% endif %}
        </p>
      </section>      
				<section>Simple Html Presentations</section>
				<section>Slide 2</section>
        <section data-markdown>
        	<textarea data-template>
        		## Page title

        		A paragraph with some text and a [link](http://hakim.se).
        	</textarea>
        </section>
			</div>
</div>
