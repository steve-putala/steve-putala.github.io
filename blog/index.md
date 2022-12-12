---
title: Posts organized by date
body_class: blog-articles
---

<div class="articles">
{% for post in site.posts %}
<a href="{{ post.url }}">
    <article>
            <h2>{{ post.title }}</h2>
            <time datetime="{{ post.date }}" itemprop="datePublished">{{ post.date | date: "%e %b %Y" }}</time>
            {{ post.excerpt }}
    </article>
</a>
{% endfor %}
</div>
