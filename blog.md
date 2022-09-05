---
layout: page
title: Blog
---

{% assign postc = site.posts | size %}
Every blog post ever made.{% if postc > 10 %} Warning: There's a lot!{% endif %} Subscribe to them using
<a href="/feed.xml" class="btn btn-sm btn-primary"><span class="fa-solid fa-rss"></span> Atom/RSS</a>.
{% if postc == 1 %}
There is 1 post.
{% else %}
There are {{ postc }} posts.
{% endif %}

{% for p in site.posts %}
- [{{ p.date | date: "%b %d %Y" }} - {{ p.title }}]({{ p.url }})
{% endfor %}
