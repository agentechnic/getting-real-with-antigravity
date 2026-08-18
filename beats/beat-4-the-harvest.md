# Beat 4 — The Harvest

**Duration:** 30 minutes

**Goal:** Everyone leaves this beat holding a Skill they did not write from scratch.

<!-- participant-start -->
## You just did a job. You are about to keep it.

Next quarter this lands on your desk again. Same folder shape, new tickets. Right now you would start over: same explaining, same plan, same corrections.

The alternative is a **Skill**. A folder with a `SKILL.md` in it that the agent loads by itself when a task matches. Write it once, and next quarter you say "do the Q3 themes" and it already knows how you work.

Most people never write one, because a blank `SKILL.md` is intimidating and nobody has time to document a process they only half remember.

So do not write it. Harvest it.

### 1. Ask for it back

In the same session, with all of today's work still in its context:

```text
Read back what we just did, start to finish. Then write it as a
Skill in .agents/skills/ticket-themes/SKILL.md so I can run the
same analysis next quarter without explaining it again. Include
YAML frontmatter with a name and a description.
```

It has the whole session. It knows you insisted on exact counts, that you made it check the changelog, that the report matches a house format. It writes that down.

Read what it produces before you keep it.

**The frontmatter is not optional here.** A Skill in this CLI needs a `name` and a `description` at the top:

```yaml
---
name: ticket-themes
description: >-
  Analyse a quarter of customer support tickets into a themes report
  with exact counts and root-cause cross-referencing against the
  product changelog.
---
```

Once that file is in place, the Skill also shows up as a slash command — `/ticket-themes` — which is a useful way to check it registered at all.

### 2. Two edits you make by hand

The draft will be roughly right and wrong in two specific places. Fix both yourself. This is the part that teaches.

#### 1. The description

Open `SKILL.md` and look at the `description` line. The agent scans that line in every session to decide whether to load this Skill at all.

A description like *"Helper for ticket work"* never fires. Nothing matches it.

A description like *"Analyse a quarter of support tickets into a themes report with exact counts, cross-referenced against the product changelog"* fires when it should, because it says what the job is and what comes out.

Rewrite it so it names the task, not the topic.

#### 2. Parameterise the quarter

The draft almost certainly hardcodes `tickets-q1/`. That is what you did today, so that is what it saw.

Change it so the folder is an input. Something like: *"Ask which quarter to analyse if the user has not said."*

One variable. That is the difference between a recording of today and a tool for next quarter.

### 3. Before you move on

Read your `SKILL.md` once more and ask: **if I read this in three months, having forgotten today, could I follow it?**

If it says "as discussed" or "the usual format", it is a diary entry. Make it instructions.
<!-- participant-end -->

## Facilitator

Thirty minutes. The first ten are fast and the last twenty are where the value is.

### This is the beat nobody else teaches

The official Antigravity material has a codelab on what a Skill is and where the file goes. What it does not do is show you that you get one by mining a session you already ran. That is the whole differentiator, so give it room.

### Say the framing before they run anything

> *"You are not going to write this. You already wrote it, this morning, by doing the work. We are just asking for it back."*

### Where the file goes, and the one path question you will get

Project Skills live in `.agents/skills/<name>/SKILL.md`, relative to the workspace. That is what today uses, and the version that travels with the folder.

Someone will ask where a *global* Skill goes — one available in every project. Answer honestly: it sits under the CLI's own config directory in the home folder, and the exact path has moved between releases and between the docs and the codelabs. Have them run `agy inspect` on their own machine and read where their install is actually looking rather than trusting a path off a slide. **Do not spend beat time on it.** Everything today is a project Skill.

### Do not stop at the harvest

It takes about four minutes. Do not let the room stop there. A drafted Skill nobody edited is a party trick. The two hand edits are the lesson.

### Watch for these

**Missing or malformed frontmatter.** A Skill with no `name` or `description` may not register at all. Quick check that costs nothing: does `/ticket-themes` appear as a slash command? If not, look at the top of the file first.

**Descriptions that will never fire.** By far the most common failure. Walk the room reading descriptions. If it starts "Helper for", "Utility to", or names a topic instead of a job, get them to rewrite it before Beat 5, because Beat 5 will expose it and you want them to have had the chance.

**Skills that hardcode Q1.** Also very common, also correct behaviour given what the agent saw. Point at the literal `tickets-q1` and ask what happens in April.

**Someone who over-engineers it.** There will be one person with a 300-line `SKILL.md` and three helper scripts. Cap it. Numbered steps, under a page. The model has a finite attention budget and so does the person reading it next quarter.

### If someone asks why not just save a prompt

Good question, answer it properly. A saved prompt is text you paste. A Skill loads itself when the task matches, carries supporting files next to it, appears as a slash command, and travels to a teammate inside a plugin. Show them `.agents/skills/` on the projector so it stops being abstract.

### What to say at the end

> *"That file is the deliverable today. Not the report. The report is one quarter. That file is every quarter after."*

[← Back to home](index.html)
