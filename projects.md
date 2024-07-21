---
layout: page
title: Projects
---

These are my mostly-working projects. Many are unpolished, but I'm proud of them nonetheless.

<div class="row row-cols-1 row-cols-md-2 g-4 justify-content-center">
    {% for project in site.data.projects %}
    <div class="col">
        <div class="card{% if project.flavor-color %} border-3 border-end-0 border-top-0 border-bottom-0{% endif %}"
            {% if project.flavor-color %}style="border-color: {{ project.flavor-color }};"{% endif %}>
            <div class="card-body">
                <h2 class="card-title h5">{{ project.title | markdownify | markdownify | remove: '<p>' | remove: '</p>' }}</h2>
                <div class="card-text">{{ project.description | markdownify }}</div>
                {% for link in project.links %}
                    <a href="{{ link.url }}" class="card-link">{{- link.text | markdownify | remove: '<p>' | remove: '</p>' | strip -}}</a>
                {% endfor %}
            </div>
        </div>
    </div>
    {% endfor %}
</div>
