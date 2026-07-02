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
      {% assign ai_engineer_talk = site.posts | where: "title", "Talk @ AI Engineer World's Fair 2026" | first %}
      {% if ai_engineer_talk %}
        <li>
          <h2>
            <a class="post-link" href="{{ ai_engineer_talk.url | relative_url }}">{{ ai_engineer_talk.title | escape }}</a>
          </h2>
          <span class="post-meta">{{ ai_engineer_talk.date | date: "%d %B %Y" }}</span>
        </li>
      {% endif %}

      <li>
        <h2>
          <a class="post-link" href="{{ '/skills-as-the-product-layer-of-agentic-systems.html' | relative_url }}">Skills are New Features</a>
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
        {% unless post.title == "Talk @ AI Engineer World's Fair 2026" %}
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
