---
layout: page
title: Blog
---

{% assign postc = site.posts | size %}
Every blog post ever made.{% if postc > 10 %} Warning: It's long.{% endif %}<br>
{% if postc == 1 %}
There is 1 post.
{% else %}
There are {{ postc }} posts.
{% endif %}

{% for p in site.posts %}
- [{{ p.date | date: "%m/%d/%Y" }} - {{ p.title }}]({{ p.url }})
{% endfor %}
