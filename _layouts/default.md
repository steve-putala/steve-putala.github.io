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
            ©2021-{{ "now" | date: "%Y" }} Steve Putala
        </footer>
    </body>
</html>