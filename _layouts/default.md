---
---

<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="keywords" content="{{ page.tags | join: ' ' | escape }}">
        <meta name="description" content="{{ page.title | strip_html | strip_newlines | escape }} - {{ page.excerpt | strip_html | strip_newlines | escape }}">
        <meta name="author" content="Steve Putala">
        <title>{{ page.title }}</title>
        <link rel="stylesheet" href="/assets/css/styles.css">
        <script src="https://kit.fontawesome.com/2ac533ff53.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <header>
            <h1><a href="/">Steve Putala</a></h1>
            <nav>
                <a href="/"{% if page.url == '/' %} class="active"{% endif %}>Home</a>
                <a href="/blog/"{% if page.url contains '/blog/' %} class="active"{% endif %}>Blog</a>
            </nav>
        </header>
        <section>
            {{ content }}
        </section>
        <footer>
            <p>©2021-{{ "now" | date: "%Y" }} Steve Putala</p>
            {% if site.data.social-media %}
            <div class="socials">
                {% assign sm = site.data.social-media %}
                {% for entry in sm %}
                    {% assign key = entry | first %}
                    {% if sm[key].id %}
                        <a href="{{ sm[key].href }}{{ sm[key].id }}" title="{{ sm[key].title }}"><i class="fa {{ sm[key].fa-icon }}"></i>{{ sm[key].id }}</a>
                    {% endif %}
                {% endfor %}
            </div>
            {% endif %}
        </footer>
    </body>
</html>