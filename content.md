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
    <ul class="post-list podcast-list" id="episode-list">
      <li class="episode-loading">Loading episodes&hellip;</li>
    </ul>
  </section>

</div>

<script>
(function () {
  var RSS = 'https://anchor.fm/s/ff1b9374/podcast/rss';
  var API = 'https://api.rss2json.com/v1/api.json?rss_url=' + encodeURIComponent(RSS);
  var list = document.getElementById('episode-list');

  fetch(API)
    .then(function (r) { return r.json(); })
    .then(function (data) {
      if (data.status !== 'ok' || !data.items.length) throw new Error();
      list.innerHTML = data.items.map(function (ep) {
        var date = new Date(ep.pubDate).toLocaleDateString('en-US', {
          year: 'numeric', month: 'long', day: 'numeric'
        });
        var desc = ep.description
          .replace(/<[^>]+>/g, '')
          .trim()
          .substring(0, 160);
        if (desc.length === 160) desc += '…';
        return '<li>'
          + '<h3><a class="post-link" href="' + ep.link + '" target="_blank" rel="noopener noreferrer">' + ep.title + '</a></h3>'
          + '<span class="post-meta">' + date + '</span>'
          + (desc ? '<p class="episode-desc">' + desc + '</p>' : '')
          + '</li>';
      }).join('');
    })
    .catch(function () {
      list.innerHTML = '<li>Could not load episodes &mdash; <a href="https://podcasts.apple.com/us/podcast/ai-blindspot/id1768690362" target="_blank" rel="noopener noreferrer">listen on Apple Podcasts</a>.</li>';
    });
}());
</script>
