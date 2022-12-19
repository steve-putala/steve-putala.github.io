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
    <body class="{{ page.body_class }}">
        <header>
            <a href="/" class="logo">Steve Putala</a>
            <nav>
                <a href="/"{% if page.url == '/' %} class="active"{% endif %}>Home</a>
                <a href="/blog/"{% if page.url contains '/blog/' %} class="active"{% endif %}>Blog</a>
            </nav>
        </header>
        <main>
            {{ content }}
        </main>
        <footer>
            {% if site.data.social-media %}
            <p class="socials">
                {% assign sm = site.data.social-media %}
                {% for entry in sm %}
                    {% assign key = entry | first %}
                    {% if sm[key].id %}
                        <a href="{{ sm[key].href }}{{ sm[key].id }}" title="{{ sm[key].title }}"><i class="fa {{ sm[key].fa-icon }}"></i>{{ sm[key].id }}</a>
                    {% endif %}
                {% endfor %}
            </p>
            {% endif %}
            <p class="copyleft">
                <span>This work is licensed under a </span>
                <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>
            </p>
            <p><a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a></p>
        </footer>
    </body>
</html>
