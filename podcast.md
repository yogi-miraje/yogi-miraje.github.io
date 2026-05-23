---
layout: default
title: Podcast
---

<article class="post">
  <header class="post-header">
    <div class="podcast-hero">
      <img class="podcast-cover" id="podcast-cover" alt="AI Blindspot podcast cover">
      <div class="podcast-hero-text">
        <h1 class="post-title">AI Blindspot</h1>
        <p class="post-meta">A human-in-the-loop podcast exploring AI's frontiers — and the blind spots we overlook.</p>
        <div class="podcast-badges">
          <a class="podcast-badge podcast-badge--spotify" href="https://open.spotify.com/show/50J3jlUI38IuG0VF21uIDk" target="_blank" rel="noopener noreferrer">
            <svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true">
              <path d="M12 0C5.4 0 0 5.4 0 12s5.4 12 12 12 12-5.4 12-12S18.66 0 12 0zm5.521 17.34c-.24.359-.66.48-1.021.24-2.82-1.74-6.36-2.101-10.561-1.141-.418.122-.779-.179-.899-.539-.12-.421.18-.78.54-.9 4.56-1.021 8.52-.6 11.64 1.32.42.18.479.659.301 1.02zm1.44-3.3c-.301.42-.841.6-1.262.3-3.239-1.98-8.159-2.58-11.939-1.38-.479.12-1.02-.12-1.14-.6-.12-.48.12-1.021.6-1.141C9.6 9.9 15 10.561 18.72 12.84c.361.181.54.78.241 1.2zm.12-3.36C15.24 8.4 8.82 8.16 5.16 9.301c-.6.179-1.2-.181-1.38-.721-.18-.601.18-1.2.72-1.381 4.26-1.26 11.28-1.02 15.721 1.621.539.3.719 1.02.419 1.56-.299.421-1.02.599-1.559.3z"/>
            </svg>
            Spotify
          </a>
          <a class="podcast-badge podcast-badge--apple" href="https://podcasts.apple.com/us/podcast/ai-blindspot/id1768690362" target="_blank" rel="noopener noreferrer">
            <svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true">
              <path d="M18.71 19.5c-.83 1.24-1.71 2.45-3.05 2.47-1.34.03-1.77-.79-3.29-.79-1.53 0-2 .77-3.27.82-1.31.05-2.3-1.32-3.14-2.53C4.25 17 2.94 12.45 4.7 9.39c.87-1.52 2.43-2.48 4.12-2.51 1.28-.02 2.5.87 3.29.87.78 0 2.26-1.07 3.8-.91.65.03 2.47.26 3.64 1.98-.09.06-2.17 1.28-2.15 3.81.03 3.02 2.65 4.03 2.68 4.04-.03.07-.42 1.44-1.38 2.83M13 3.5c.73-.83 1.94-1.46 2.94-1.5.13 1.17-.34 2.35-1.04 3.19-.69.85-1.83 1.51-2.95 1.42-.15-1.15.41-2.35 1.05-3.11z"/>
            </svg>
            Apple Podcasts
          </a>
        </div>
      </div>
    </div>
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
  var cover = document.getElementById('podcast-cover');

  fetch(RSS, { cache: 'no-store' })
    .then(function (r) { return r.text(); })
    .then(function (xml) {
      var imgMatch = xml.match(/<itunes:image[^>]+href="([^"]+)"/);
      if (imgMatch && cover) {
        cover.src = imgMatch[1];
        cover.style.display = 'block';
      }

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
