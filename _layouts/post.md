---
layout: default
---

<article class="post">
    <aside class="heading">
        <time datetime="{{ page.date }}" itemprop="datePublished">{{ page.date | date: "%e %b %Y" }}</time>
        <!-- @TODO: make the tags links -->
        Tags:
        {% for tag in page.tags %}
            <a href="/blog/tags.html#{{ tag | replace: ' ', '-' }}">{{ tag }}</a>{% if forloop.last %}{% else %},{% endif %}
        {% endfor %}
    </aside>
    <h1>{{ page.title }}</h1>
    {{ content }}
</article>