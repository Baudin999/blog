---
layout: default
title: "A structured analysis of the populist movement"
permalink: populism
---

{% assign chapters = site.populism | sort: "order" %}
{% for chapter in chapters %}
<h1>{{ chapter.title }}</h1>
{{ chapter.content }}
<hr>
{% endfor %}

# References

{% include scholar/bibliography.html %}
