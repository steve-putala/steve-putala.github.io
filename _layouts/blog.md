---
layout: default
---

<h1>{{ page.title }}</h1>
<nav class="pipe-separator">
    Switch view to:
    <a href="index.html"{% if page.url == '/blog/' %} class="active"{% endif %}>Date</a>
    <a href="tags.html"{% if page.url == '/blog/tags.html' %} class=" active"{% endif %}>Tag</a>
    <a href="categories.html"{% if page.url == '/blog/categories.html' %} class=" active"{% endif %}>Category</a>
</nav>
{{ content }}
