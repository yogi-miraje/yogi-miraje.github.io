---
layout: default
title: Blog
---

<div class="post">
  <header class="post-header">
    <h1 class="post-title">{{ page.title }}</h1>
  </header>

  <div class="post-content">

    <ul class="post-list">
      <li>
        <h2>
          <a class="post-link" href="{{ '/' | relative_url }}">Building effective AI applications</a>
        </h2>
        <span class="post-meta">30 April 2025</span>
      </li>

      {% for post in site.posts %}
        <li>
          <h2>
            <a class="post-link" href="{{ post.url | relative_url }}">{{ post.title | escape }}</a>
          </h2>
          <span class="post-meta">{{ post.date | date: "%d %B %Y" }}</span>
          <!-- Optional: Add post excerpt -->
          <!-- {{ post.excerpt }} -->
        </li>
      {% endfor %}
    </ul>

  </div>
</div> 