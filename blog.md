---
layout: default
title: Writing
---

<div class="post">
  <header class="post-header">
    <h1 class="post-title">{{ page.title }}</h1>
  </header>

  <div class="post-content">

    <ul class="post-list">
      {% assign skills_new_features = site.posts | where: "title", "Skills are New Features" | first %}
      {% if skills_new_features %}
        <li>
          <h2>
            <a class="post-link" href="{{ skills_new_features.url | relative_url }}">{{ skills_new_features.title | escape }}</a>
          </h2>
          <span class="post-meta">{{ skills_new_features.date | date: "%d %B %Y" }}</span>
        </li>
      {% endif %}

      <li>
        <h2>
          <a class="post-link" href="{{ '/skills-as-the-product-layer-of-agentic-systems.html' | relative_url }}">Skills as the Product Layer of Agentic Systems</a>
        </h2>
        <span class="post-meta">25 May 2026</span>
      </li>
      <li>
        <h2>
          <a class="post-link" href="{{ '/building-effective-ai-applications.html' | relative_url }}">Building effective AI applications</a>
        </h2>
        <span class="post-meta">30 April 2025</span>
      </li>

      {% for post in site.posts %}
        {% unless post.title == "Skills are New Features" %}
          <li>
            <h2>
              <a class="post-link" href="{{ post.url | relative_url }}">{{ post.title | escape }}</a>
            </h2>
            <span class="post-meta">{{ post.date | date: "%d %B %Y" }}</span>
          </li>
        {% endunless %}
      {% endfor %}
    </ul>

  </div>
</div>
