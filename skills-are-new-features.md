---
layout: default
title: Skills are New Features
---

<article class="post">
  <header class="post-header">
    <h1 class="post-title">Skills are New Features</h1>
    <span class="post-meta">25 May 2026</span>
  </header>

  <div class="post-content">

    <p>Every team building an AI product eventually hits the same question, usually after they've already answered it wrong: where does product-specific behavior live?</p>

    <p>Not "how do we make the agent smarter." The narrower one. A product needs the agent to act like a research assistant, or a portfolio analyst, or a support copilot. Where does that behavior actually go?</p>

    <p>Most teams answer it badly. It ends up smeared across a system prompt nobody owns, a few tools that quietly encode undocumented assumptions, and a handful of agents that each reinvent the same logic. This works for a while. Then it breaks, and nobody can find the piece that broke.</p>

    <p>I think the answer is skills. Not as a best practice you adopt because a blog post told you to, but as an actual architectural position: <strong>skills are the product layer of agentic systems.</strong></p>

    <hr>

    <h2>Why the obvious answers don't work</h2>

    <p>It's worth walking through the alternatives, because most teams try several of them before landing anywhere.</p>

    <p><strong>Put it in the model.</strong> Fine-tuning product behavior into the weights is slow and expensive, and you get to redo it every time the product changes. You also can't inspect what it learned. The model is supposed to be general intelligence; it has no business knowing your output format.</p>

    <p><strong>Put it in the system prompt.</strong> This is where most teams end up. The prompt grows until it's a few thousand tokens of instructions that quietly contradict each other, with global policy and one-off feature quirks crammed into the same blob. Debugging it means rereading an essay. Versioning it means diffing prose.</p>

    <p><strong>Put it in the tools.</strong> Tools are primitive actions, which makes them both powerful and undisciplined. Hand every tool to every task and you get inconsistent behavior with no real governance. A tool that can do anything will, eventually, do the wrong thing.</p>

    <p><strong>Create one agent per feature.</strong> Clean at first. Then you've got a dozen agents reimplementing the same context-fetching and the same formatting, and keeping them in sync becomes somebody's full-time job. Ownership splinters. Every new feature pays a tax.</p>

    <p><strong>Hardcode the workflows.</strong> This one is reliable and also brittle. The product logic spreads across pipelines that don't know about each other, reuse turns into copy-paste, and changing anything starts to feel like surgery.</p>

    <p>People have shipped all five of these. They each produce a different flavor of mess, but the underlying failure is identical: there's no clean place for product behavior to live.</p>

    <hr>

    <h2>What a skill actually is</h2>

    <p>A skill is not a prompt template.</p>

    <p>A prompt template is text that tells the model what to do. A skill is an executable artifact. It can call tools, run scripts, and carry its own files: reference docs, output templates, lookup tables, the example outputs that show what a good result is. It's closer to a microservice than a string.</p>

    <p>Take a skill for equity research. It isn't a paragraph of instructions. It carries the analyst-approved templates, the specific tools that task is allowed to touch, the context the agent should pull before it starts, and the output format the desk expects. That whole bundle gets versioned and tested as one unit.</p>

    <p>Put more precisely, a skill is a product-specific capability package that tells a general agent how to do a repeatable task in a particular product context. It owns:</p>

    <ul>
      <li><strong>Activation conditions</strong> — when to engage</li>
      <li><strong>Context requirements</strong> — what it needs before starting</li>
      <li><strong>Tool permissions</strong> — what it's allowed to use</li>
      <li><strong>Procedure</strong> — how the work should be done</li>
      <li><strong>Output contract</strong> — format, length, quality bar</li>
      <li><strong>Assets</strong> — templates, reference material, examples</li>
      <li><strong>Evals</strong> — how to tell whether it worked</li>
    </ul>

    <p>Everything product-specific now has somewhere to go, and the runtime underneath it stays general.</p>

    <hr>

    <h2>The shift most teams haven't made yet</h2>

    <p>Here's the part I think matters most, and the part most teams haven't internalized. A skill is a contribution boundary. It's a place where someone who isn't an engineer can do real work.</p>

    <p>A product manager who knows the domain can write the conditions that decide when a skill fires. A domain expert can specify the output contract and drop in a few example outputs to calibrate against. The analyst team can own the reference material outright. When a business rule changes, whoever owns the skill edits it directly, instead of filing a ticket and waiting a sprint for an engineer to wire in a new branch.</p>

    <p>DevOps did something similar a layer down. Before it matured, shipping code meant understanding the servers it ran on. DevOps drew a clean line between the infrastructure and the application: engineers could push features without knowing how the deploy worked, and the platform team could rework the deploy without breaking everyone's features. The line is what made that possible.</p>

    <p>Skills are that line for AI products. Engineers own the runtime and the tools beneath it. Product people own the behavior on top. The interesting consequence isn't tidier code. It's that the people closest to the product can change how it behaves without routing every change through engineering.</p>

    <hr>

    <h2>What this looks like in practice</h2>

    <p>The end state is one general-purpose runtime running many skills, with a permission layer underneath that decides what each skill is allowed to touch.</p>

    <pre><code>General agent runtime
  + Skill registry           (discoverable, versioned capabilities)
  + Context providers        (pre-skill context assembly)
  + Tool permission layer    (per-skill authorization)
  + Skill-level evals        (independent quality measurement)
  + Product surfaces         (the experiences built on top)</code></pre>

    <p>Every skill is versioned on its own and carries its own evals, so you can change one without redeploying the runtime or worrying about the rest. Adding a capability means writing a skill rather than standing up another agent. And when two surfaces need the same behavior, they share the skill instead of copy-pasting a prompt between them.</p>

    <p>That buys you a handful of things that are otherwise hard to get. The same skill runs on the web app and the API unchanged. Because its tool access is fixed, you can actually trace what it did when something goes sideways. Its evals are scoped tightly enough to mean something. And there's a name attached to it: a team that owns this skill, instead of a shared system prompt that everyone edits and no one is responsible for.</p>

    <hr>

    <h2>The coding agent proof point</h2>

    <p>Coding agents already work this way, which is the best evidence we have that the pattern holds.</p>

    <p>A good coding skill knows your repo's conventions, the scripts worth running, and which tests have to pass before anything ships. It carries that context around with it and produces output against a known contract. That is already a product-specific capability package riding on a general execution environment — the exact thing I'm arguing product teams should be building.</p>

    <p>The discipline that makes those skills reliable is the same discipline product work needs: be explicit about what context the task requires, which tools it can use, and what counts as a correct result. None of that is new. It just hasn't moved out of the repo and into the rest of the product yet.</p>

    <hr>

    <h2>Gotchas</h2>

    <p>These are the things that tend to bite teams the first time they structure behavior this way.</p>

    <p><strong>Skills without evals are just hope.</strong> If you can't measure a skill, you can't tell whether your last edit helped it or quietly broke it. Build a small eval set alongside the skill; five examples is enough to start. Skip this and every future change becomes a guess.</p>

    <p><strong>The description field is a trigger, not a summary.</strong> When the agent starts up, it reads a one-line description of every available skill and uses that to decide which one to reach for. So write the description for the model, not for a human skimming a list. When a skill mysteriously never fires, a vague description is usually the reason.</p>

    <p><strong>Someone has to own each skill.</strong> The contribution boundary only works if there's a name attached. Ownerless skills rot: the instructions go stale, the gotchas never get written down, and two near-duplicates slowly drift apart. Assign an owner before you publish, not after it breaks.</p>

    <p><strong>Watch for sprawl.</strong> The thing that makes skills easy to create also makes them easy to over-create. Two skills that overlap will eventually hand the agent conflicting instructions for the same situation. Before writing a new one, check whether an existing skill should just be extended. This gets more important as the library grows, not less.</p>

    <hr>

    <h2>The core principle</h2>

    <p>None of this makes the agent any smarter, and that's the point worth sitting with. The model is exactly as capable either way. What changes is that product behavior finally has somewhere to live that isn't the model, the system prompt, or a pile of one-off agents.</p>

    <p>So a skill is a deployable unit of product behavior. You can write it, test it, version it, and hand it to someone who isn't an engineer. It changes as the product changes, on its own clock.</p>

    <p>We're early here, and I'd rather be honest about that than pretend otherwise. Most of what I know came from getting it wrong and adjusting. Treat all of this as field notes rather than a finished playbook. The fastest way to understand any of it is to build one skill, hit your first real gotcha, and write that gotcha down.</p>

  </div>
</article>
