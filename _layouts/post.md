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

    {% if page.references %}
        <section class="references">
            <h2>References</h2>
            <ul>
            {% for reference in page.references %}
                <li>
                    {% if reference.text %}
                        {{ reference.text }}
                    {% endif %}
                    <a href="{{ reference.href }}" class="external">{{ reference.link }}</a>
                </li>
            {% endfor %}
            </ul>
        </section>
    {% endif %}

    <footer>

        {% include share-to.md %}

        <section>
            <script src="https://utteranc.es/client.js"
                repo="steve-putala/steve-putala.github.io"
                issue-term="pathname"
                theme="github-light"
                crossorigin="anonymous"
                async>
            </script>
        </section>

    </footer>
</article>
