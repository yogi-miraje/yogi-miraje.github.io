---
layout: default
title: Content
---

<div class="content-page">

  <section class="content-section">
    <h2 class="content-section-title">Writing</h2>
    <ul class="post-list">
      <li>
        <h3><a class="post-link" href="{{ '/building-effective-ai-applications.html' | relative_url }}">Building effective AI applications</a></h3>
        <span class="post-meta">30 April 2025</span>
      </li>
      {% for post in site.posts %}
        <li>
          <h3><a class="post-link" href="{{ post.url | relative_url }}">{{ post.title | escape }}</a></h3>
          <span class="post-meta">{{ post.date | date: "%d %B %Y" }}</span>
        </li>
      {% endfor %}
    </ul>
  </section>

  <section class="content-section">
    <h2 class="content-section-title">Podcast &mdash; AI Blindspot</h2>
    <p class="content-section-desc">Exploring the frontiers of artificial intelligence and the blind spots we often overlook in its development and deployment.</p>
    <a class="podcast-badge" href="https://podcasts.apple.com/us/podcast/ai-blindspot/id1768690362" target="_blank" rel="noopener noreferrer">Listen on Apple Podcasts</a>
    <ul class="post-list podcast-list">
      <!-- Episodes will be listed here -->
    </ul>
  </section>

</div>
