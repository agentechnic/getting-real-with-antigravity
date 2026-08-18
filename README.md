# Getting Real with Antigravity

**Do It Once, Then Never Again** — a 3-hour, mixed-audience workshop on the
Antigravity CLI (`agy`), by [Agentechnic](https://github.com/agentechnic).

You do one piece of real work with an agent, then turn that work into a Skill
that repeats — and prove the Skill works by testing it in a clean context.

The anchor task is not a coding task. Attendees analyse a quarter of bilingual
customer support tickets for a fictional Riyadh delivery company and write the
themes report. Students, engineers, devops and managers can all do it.

## Open it

No build step, no dependencies. Open `index.html` in a browser, or serve the
folder:

```bash
python3 -m http.server 8000
```

## What's here

```
index.html        landing page
viewer.html       markdown renderer (?file=beats/beat-0-setup.md)
beats/            the eight beats — participant and facilitator views in one file
resources/        prereqs, glossary, plan mode, permissions, quota, templates
facilitator/      dry-run record — not linked from the site
scripts/          verify links
```

## The shape of the session

| Beat | Duration | What happens |
|---|---|---|
| 0 — Setup | 30 min | `agy` running inside `nussaa/`, workspace trusted, quota noted |
| 1 — The Wall | 15 min | Do the job in a chat box. Find out where it stops |
| 2 — The Loop | 20 min | Same job in the terminal. It reads all 200 tickets. Meet `AGENTS.md` |
| 3 — The Work | 45 min | Model choice, Plan Mode, the real report, and the hidden signal |
| 4 — The Harvest | 30 min | Ask for the workflow back as a Skill. Two hand edits |
| 5 — The Proof | 25 min | A cold subagent runs it on a second batch and says what it guessed |
| 6 — Scale It | 10 min | Containment, one MCP server, and packaging as a plugin |
| 7 — Wrap | 5 min | What to do tonight |

## Running it yourself

Everything a facilitator needs is on the Facilitator tab of each beat page.
Two things to do before the day:

1. **Tell attendees to sign in with a personal Google account.** Corporate and
   Workspace accounts are frequently blocked from the Antigravity CLI by an
   admin setting, and it cannot be fixed in the room. This is the single
   biggest risk to Beat 0.
2. **Read the [corpus answer key](https://github.com/agentechnic/nussaa-tickets-corpus/blob/main/facilitator/nussaa-answer-key.md)
   and `facilitator/agy-dry-run.md`.** The first holds the planted signal and
   both routes attendees take to it. The second is the record of a full run on
   `agy`, including what broke.

After any change to links or content:

```bash
bash scripts/verify-links.sh
```

### The corpus lives elsewhere

The 320 tickets are not in this repository. They are a shared fixture used by
more than one workshop, and they live in
[**nussaa-tickets-corpus**](https://github.com/agentechnic/nussaa-tickets-corpus) with their generator, their property tests and
the facilitator answer key.

**This workshop is calibrated against corpus `v1.0.0`.** Every count in the
beats and in the answer key comes from that version. If you bump the corpus,
re-read the facilitator notes before you run the session — a spec change moves
the numbers.

The download links in `resources/prerequisites.md`,
`resources/the-material.md` and `beats/beat-0-setup.md` point at a pinned
release asset. Change the pin in all three or none — `verify-links.sh` fails
if they disagree.

## Cost

Nothing. The workshop is built and tested against the free **Antigravity
Starter Quota** — a personal Google account and no card. See
`resources/free-tier-and-quota.md` for what that gives you and how to measure
what a session actually spends.

## Provenance and independence

This is an independent workshop. It is not affiliated with, endorsed by, or
produced by Google, and it uses no Google or Antigravity logos or brand assets.

It is a port of Agentechnic's Claude Code workshop of the same name. The
teaching structure and the Nussaa corpus carry over; the tooling vocabulary,
account model and failure modes were rewritten against real `agy` runs rather
than translated.

Nussaa (نص ساعة) does not exist. Its customers, riders and complaints were
written for this workshop.

---

From Agentechnic with ♥
