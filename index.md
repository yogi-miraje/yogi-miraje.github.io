---
layout: home
title: Yogi Miraje
---

<div class="post-content bio-content">
  <p>Hi, I'm Yogi.</p>

  <p>I build software systems that turn complex ideas into reliable products. My path has taken me through backend engineering, machine learning, and now systems where language models are part of the stack.</p>

  <p>That path has shaped how I think.</p>

  <p>I don't approach these problems from the demo outward. I approach them from the failure modes inward: what breaks, what scales, what can be trusted, what needs to be measured, and what happens when real users start depending on it.</p>

  <p>The work that excites me most is not the loudest version of AI. It's the quieter kind: a well-designed system that removes a bottleneck, compresses weeks of effort into minutes, or gives people a clearer way to think through complex work.</p>

  <p>My default question is simple:</p>

  <blockquote>What is the simplest thing that actually works?</blockquote>

  <p>That usually means resisting complexity before adding it. Before reaching for a larger model, a multi-step workflow, or a network of agents, I want to understand the problem underneath: the user need, the edge cases, the cost of being wrong, and the point where automation should stop.</p>

  <p>I'm most interested in the space between engineering judgment and emerging AI capability — where systems need to be useful, understandable, testable, and safe enough to put in front of real people.</p>

  <p>To me, good AI work is not about making software seem intelligent.</p>

  <p>It is about making software more capable while keeping the system grounded, observable, and under control.</p>
</div>

<section class="podcast-section">
  <h2 class="section-heading">AI Blindspot</h2>
  <p class="section-subheading">A human-in-the-loop podcast exploring AI's frontiers — and the blind spots we overlook.</p>
  <ul class="post-list" id="episode-list">
    <li class="episode-loading">Loading episodes…</li>
  </ul>
</section>

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
