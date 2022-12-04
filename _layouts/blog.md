---
layout: default
---

<h1>{{ page.title }}</h1>
<nav class="pipe-separator switch-view">
    <div>Switch view to:</div>
    <div>
        <a href="index.html"{% if page.url == '/blog/' %} class="active"{% endif %}>Date</a>
        <a href="tags.html"{% if page.url == '/blog/tags.html' %} class=" active"{% endif %}>Tag</a>
        <a href="categories.html"{% if page.url == '/blog/categories.html' %} class=" active"{% endif %}>Category</a>
    </div>
</nav>
{{ content }}
