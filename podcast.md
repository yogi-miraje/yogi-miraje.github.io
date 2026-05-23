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
  var list = document.getElementById('episode-list');

  // Fetch the RSS feed directly and parse it client-side so we always
  // show the latest episodes (third-party JSON proxies cache stale copies).
  fetch(RSS, { cache: 'no-store' })
    .then(function (r) { return r.text(); })
    .then(function (xml) {
      var doc = new DOMParser().parseFromString(xml, 'application/xml');
      var items = Array.prototype.slice.call(doc.querySelectorAll('item'));
      if (!items.length) throw new Error('no items');

      list.innerHTML = items.map(function (item) {
        var get = function (tag) {
          var el = item.querySelector(tag);
          return el ? el.textContent.trim() : '';
        };
        var title = get('title');
        var guid = get('guid');
        var link = (guid && guid.indexOf('http') === 0 ? guid : null) || get('link');
        var date = new Date(get('pubDate')).toLocaleDateString('en-US', {
          year: 'numeric', month: 'long', day: 'numeric'
        });
        var desc = get('description').replace(/<[^>]+>/g, '').trim().substring(0, 160);
        if (desc.length === 160) desc += '…';
        return '<li>' +
          '<a class="post-link" href="' + link + '">' + title + '</a>' +
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
