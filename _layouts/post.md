---
layout: default
---

<article class="post">
    <header class="article-tags-header">
        <time datetime="{{ page.date }}" itemprop="datePublished"><i class="fa fa-calendar"></i> {{ page.date | date: "%e %b %Y" }}</time>
        <div>
            Tags:
            {% for tag in page.tags %}
                <a href="/blog/tags.html#{{ tag | replace: ' ', '-' }}">{{ tag }}</a>{% if forloop.last %}{% else %},{% endif %}
            {% endfor %}
        </div>
    </header>

    <h1>{{ page.title }}</h1>
    {{ content }}

    <footer>
        {% include share-to.md %}
    </footer>
</article>
