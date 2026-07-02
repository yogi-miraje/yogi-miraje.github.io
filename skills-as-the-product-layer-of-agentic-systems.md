---
layout: default
title: Skills are New Features
---

<article class="post">
  <header class="post-header">
    <h1 class="post-title">Skills are New Features</h1>
    <span class="post-meta">2 July 2026</span>
  </header>

  <div class="post-content">

    <p>Most online discussion of skills focuses on coding harnesses: how to write a good skill for a coding agent. This post is different. It's about skills in agentic <em>products</em>, in non-coding domains: how to add skill support to your own harness, and what actually breaks in production.</p>

    <h2>From Screens to Conversation</h2>

    <p>Traditional products are a surface made of screens: buttons, forms, dashboards, workflows. Users navigate your UI to get things done. Agentic products collapse that surface into a conversation. The user talks to the agent, and the agent becomes the main way people get things done in your product.</p>

    <p>That collapse raises a real question. If the agent is now the interface, where does product behavior actually live? Where do your features go?</p>

    <h2>Who, What, and How</h2>

    <p>A simple framing answers this. Prompts define <em>who</em> the agent is. Tools define <em>what</em> it can connect to. Skills define <em>how</em> a task gets done. As an industry, we've already converged on the answer: skills are the new features.</p>

    <p>Anthropic's financial services plugins are a good example. Equity research and wealth management workflows that used to be buttons, dashboards, and dropdowns are now skills.</p>

    <p>One underrated effect of this shift is who gets to build features. Skills can be written by anyone who understands the product, not just engineers. That means non-engineers can now ship features too. Which raises another question: if anyone can ship a feature, what's left for engineers to do? The answer is that we ship the harness: the vehicle that lets skills run smoothly.</p>

    <h2>What a Skill Actually Is</h2>

    <p>Before talking about the harness, it helps to define the thing it's supporting. The dictionary definition of skill is "the ability to do something well." A model can function without one, but it needs skills to do a specific job well. Agent Skills are simply the way you teach an agent to do a specific task well.</p>

    <p>In its simplest form, a skill is a single markdown file. In its most complex form, it's a folder with multiple files and executable scripts. Either way, the file called <code>SKILL.md</code> is the heart of it. The frontmatter holds the name and description. The body holds everything else, including references to other files.</p>

    <pre><code class="language-markdown">---
name: company-research
description: Use when the user asks for company research or a company report.
---

# Company Research

1. Search the web for recent company information.
2. Summarize findings into structured markdown.</code></pre>

    <h2>Adding Skill Support to a Harness</h2>

    <p>You need surprisingly little to support skills: a skill registry, a system prompt you control, and a file-read tool. That's the bare minimum. If your skills execute scripts, add a code execution environment too.</p>

    <p>The registry itself is simple. It's just a collection of skill frontmatter: the name, the description, and a path to the <code>SKILL.md</code> file. Nothing more.</p>

    <p>Say you have three skills: <code>company-research</code>, which searches the web and produces markdown; <code>report-html</code>, which turns that markdown into an HTML report; and <code>report-pdf</code>, which turns it into a PDF. At runtime, you strip out just the names and descriptions of every skill and append them to the system prompt.</p>

    <p>That's what the agent actually sees: your system prompt, plus a short list of available skills. If a user asks for a basic research report on a company, the agent recognizes it has a skill for that, and follows the instructions inside it. Once the research is generated, it moves on to the report skill and follows that.</p>

    <h2>Descriptions Are Routing Signals</h2>

    <p>This is the biggest lesson from production. In the example above, two report skills exist, but only the HTML one fires by default. That's because the PDF skill's description explicitly says it should only be used when the user asks for a PDF. The description is what routes the request, not the skill's internal logic.</p>

    <p>A few rules follow from this. Write descriptions around the words a <em>user</em> would say, not around how you'd describe the skill internally. Keep descriptions distinct from each other. If two descriptions start looking similar, that's a sign to consolidate them into one skill. And don't let descriptions go stale. A stale description is one of the most common reasons a skill silently stops triggering.</p>

    <h2>Cut Skills by Intent, Not by Data Model</h2>

    <p>Early on, I built skills around narrow technical use cases, like "do estimates analysis" or "find transcript info." As real usage came in, it became clear this was the wrong cut, and I had to refactor more than once.</p>

    <p>Users don't think in terms of your data model. They think in terms of what they're trying to accomplish. In practice, that means replacing separate Fundamentals, Estimates, and Earnings Transcript skills with a single earnings-preparation skill that covers what a user actually wants when preparing for earnings season.</p>

    <h2>Skills Are Contracts, Not Documentation</h2>

    <p>A true story from production: we upgraded to a new model, and skills that had worked fine started failing. Nothing about the skills themselves had changed. It turned out some critical instructions were placed near the end of the file, and the new model was weighting the beginning of the document much more heavily than the old one did.</p>

    <p>The lesson is that skills aren't documentation you write once and forget. They're contracts, and those contracts are versioned to a specific model. Every time you bump model versions, re-run your evals against your skill library before trusting it in production.</p>

    <h2>TLDR;</h2>

    <p>Our role as engineers is shifting. Instead of shipping individual features, we're shipping the harness that lets skills run: the registry, the routing, the system prompt scaffolding around them. Agentic products are increasingly built on skill-centric harnesses, where skills carry the "how" of getting work done. And because those skills are contracts tied to a specific model, they need the same evaluation discipline you'd give any other production system.</p>

  </div>
</article>
