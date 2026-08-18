# AGENTS.md — getting-real-with-antigravity site

Context for any agent working on this repository.

## What this is

A static site that hosts the "Getting Real with Antigravity" workshop kit by
Agentechnic — a 3-hour, mixed-audience session on the Antigravity CLI (`agy`),
run in Riyadh. The site is the workshop's reference material: facilitators link
learners to specific pages during the session, and the pages teach on their own
afterwards.

It is a port of the same workshop built for a different agent CLI. The
pedagogy is unchanged; the vocabulary, the failure modes and the account model
are not.

## How it's built

No build step. Three layers:

1. `index.html` — landing page. Tailwind via CDN, hand-written cards, links to
   viewer pages.
2. `viewer.html` — generic markdown renderer. Reads `?file=<path>.md`, fetches
   it, renders via marked + highlight.js + mermaid. Restricts paths to
   `beats/`, `resources/`, `facilitator/`.
3. Markdown in `beats/`, `resources/`, `facilitator/` — the actual content.

The ticket corpus is **not in this repository**. It is a shared fixture in
[nussaa-tickets-corpus](https://github.com/agentechnic/nussaa-tickets-corpus), which also owns the generator, the property tests
and the facilitator answer key. This workshop is pinned to corpus `v1.1.0`, and
attendees download it from that repository's release.

## Conventions

- Palette, taken from Antigravity's own dark design tokens: bg `#121317`,
  panel `#18191d`, card `#1e1f24`, card hover `#212226`, border `#2b2d33`,
  fg `#e8eaed`, muted `#9aa0a6`, accent `#8ab4f8`, accent hover `#aecbfa`,
  accent strong `#3279f9`, accent soft `rgba(138,180,248,0.14)`. Mirror these
  everywhere.
- No Google or Antigravity logos, wordmarks or brand assets. Colour and
  styling only. This is an independent workshop, not an official one.
- Footer everywhere: "From Agentechnic with ♥".
- Beat pages carry both audiences in one file, split by
  `<!-- participant-start -->` / `<!-- participant-end -->`. Anything before
  the first participant block is shown to both.
- Durations, never clock times. A beat says "45 minutes", not "13:15".
- No JavaScript frameworks. No bundlers. If you reach for one, stop.
- New markdown goes in one of the three content folders, and `index.html` gets
  a card linking to it via `viewer.html?file=<path>`.
- After any change to links or content, run `bash scripts/verify-links.sh`.

## What not to do

- Do not introduce a build step. The point is "open the folder in a browser and
  it works".
- Do not add tracking, analytics, or third-party JS beyond the CDNs already in
  use.
- Do not vendor the corpus back into this repository. If you need it locally,
  download the pinned release. One copy, one version, one source of truth.
- Do not change the corpus pin in one file. Three files carry the download URL,
  and a room split across two corpus versions is the worst failure this
  material has, because nobody notices until the counts disagree.
- Do not put answer-key material in `beats/` or `resources/`. The planted
  signal and its numbers live in `facilitator/` and are not linked from the
  landing page.
- Do not state a file path or command for `agy` that has not been checked on a
  real install. Paths have moved between releases, and the docs and the
  codelabs disagree in places. When unsure, tell the reader to run
  `agy inspect` rather than guessing.
- Do not soften the permission and account warnings. They are the two things
  most likely to break a live session.

## Facts this material depends on

Verified on a free-tier personal Google account against `agy` 1.1.13/1.1.14:

- No `agy doctor`. Environment check is `agy --version` and `agy models`.
- Plan Mode: `/plan` in session, or `agy --mode plan` at launch.
- Skills: `.agents/skills/<name>/SKILL.md`, YAML `name` + `description`,
  auto-exposed as a slash command.
- Subagents: `.agents/agents/<name>.md` with `subagent: true`, listed by
  `/agents`.
- Plugins: `.agents/plugins/<name>/` with `plugin.json`, `rules/`, `skills/`,
  `mcp_config.json`; checked with `agy plugin validate`.
- Free tier is the "Antigravity Starter Quota": two independent pools (Gemini,
  and Claude/GPT), percentage-based, weekly refresh. No published numbers, and
  no bring-your-own-key.
- The command allow-list matches whole command strings, so a rule for `ls` does
  not cover `pwd && ls -la`.

Full record, including what broke: `facilitator/agy-dry-run.md`.
