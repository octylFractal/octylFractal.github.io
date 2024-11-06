---
layout: page
title: Projects
---

These are my mostly-working projects. Many are unpolished, but I'm proud of them nonetheless.

<div class="row row-cols-1 row-cols-md-2 g-4 justify-content-center">
    {% for project in site.data.projects %}
    {% if project.flavor-color %}
        {% assign color = project.flavor-color %}
    {% else %}
        {% assign color = nil %}
    {% endif %}
    <div class="col">
        <div class="card{% if color %} border-3 border-top-0 border-bottom-0{% endif %}"
            {% if color %}style="border-color: {{ color }};"{% endif %}>
            <div class="card-body">
                <h2 class="card-title h5">{{ project.title | markdownify | remove: '<p>' | remove: '</p>' }}</h2>
                <div class="card-text">
                    {% if project.deprecated %}
                        <p class="border border-5 border-danger bg-dark p-3">⚠️ Deprecated {{ project.deprecated | markdownify | remove: '<p>' | remove: '</p>'  }}</p>
                    {% endif %}
                    {{ project.description | markdownify }}
                </div>
                {% for link in project.links %}
                    <a href="{{ link.url }}" class="card-link">{{- link.text | markdownify | remove: '<p>' | remove: '</p>' | strip -}}</a>
                {% endfor %}
            </div>
        </div>
    </div>
    {% endfor %}
</div>
