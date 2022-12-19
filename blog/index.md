---
title: Posts organized by date
body_class: blog-index
---

<article class="articles">
    {% for post in site.posts %}
        <article class="article">
            <a href="{{ post.url }}">
                <h2>{{ post.title }}</h2>
                <time datetime="{{ post.date }}" itemprop="datePublished">{{ post.date | date: "%e %b %Y" }}</time>
                    {{ post.excerpt }}
            </a>
        </article>
    {% endfor %}
</article>
