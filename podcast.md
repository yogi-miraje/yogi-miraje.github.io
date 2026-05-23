---
layout: default
title: Podcast
---

<article class="post">
  <header class="post-header">
    <h1 class="post-title">AI Blindspot</h1>
    <p class="post-meta">A human-in-the-loop podcast exploring AI's frontiers — and the blind spots we overlook.</p>
  </header>
  <div class="post-content">
    <ul class="post-list" id="episode-list">
      <li class="episode-loading">Loading episodes…</li>
    </ul>
  </div>
</article>

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
        var desc = ep.description.replace(/<[^>]+>/g, '').trim().substring(0, 160);
        if (desc.length === 160) desc += '…';
        return '<li>' +
          '<a class="post-link" href="' + ep.link + '">' + ep.title + '</a>' +
          '<span class="post-meta">' + date + '</span>' +
          (desc ? '<p class="episode-desc">' + desc + '</p>' : '') +
          '</li>';
      }).join('');
    })
    .catch(function () {
      list.innerHTML = '<li>Could not load episodes — <a href="https://podcasts.apple.com/us/podcast/ai-blindspot/id1768690362">listen on Apple Podcasts</a>.</li>';
    });
}());
</script>
