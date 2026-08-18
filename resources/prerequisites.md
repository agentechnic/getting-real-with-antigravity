# Prerequisites

**Read this before you arrive. Twenty minutes of setup at home.**

Three hours is not enough time to debug an install or an account. Two things have to work before you walk in, and neither of them is Python.

## 1. The Antigravity CLI, installed and signed in

The CLI is `agy`. It runs the same agent harness as the Antigravity IDE, in a terminal.

**Install it** following the current instructions at [antigravity.google](https://antigravity.google/) — the install command has changed between releases often enough that copying one off a workshop page is a bad idea. If you already have it:

```bash
agy install     # sets up / repairs the install
agy --version   # prints 1.1.x
```

Run `agy` once in any folder. It sends you to a browser to sign in.

**Then check it properly:**

```bash
agy models
```

This is the real health check. It only answers once you are signed in *and* your account is eligible, which makes it the one command worth running before you travel. There is no `agy doctor`.

### Sign in with a personal Google account

**This is the single most important line on this page.**

Access to Antigravity is an admin-controlled setting on Google Workspace domains, and in most organisations it is switched off. If you sign in with your work email you will most likely get an eligibility error, and **nobody at the workshop can fix that** — it needs a change in your own IT department's admin console.

So: personal Gmail. Sort it at home. If your only Google account is a work one, either ask your admin this week or create a personal account for the session.

Other constraints worth knowing: you must be 18+, and Antigravity is only available in supported countries. Saudi Arabia is supported. See the [KSA access notes](viewer.html?file=resources/ksa-access.md) if you hit a wall.

### You do not need a paid plan

Signing in with a personal Google account gives you the **Antigravity Starter Quota**, which is free and is what this workshop is built for. Nobody needs a subscription, a credit card, or an API key.

There is no bring-your-own-key option for this CLI, so an existing Gemini API key does not help you here.

More detail, including how to see what you have left: [the free tier and your quota](viewer.html?file=resources/free-tier-and-quota.md).

## 2. The material, downloaded

Do this at home, not on venue wifi alongside twenty other people.

**[Download nussaa.zip](https://github.com/agentechnic/nussaa-tickets-corpus/releases/download/v1.2.0/nussaa.zip)** — 110KB, no git needed. Unzip it anywhere.

```bash
cd nussaa
ls
```

You should see `tickets-q1`, `tickets-q2`, `context`, `AGENTS.md` and `README.md`.

**Then check the agent can see it:**

```bash
agy
```

It will ask whether you trust this workspace the first time. Say yes.

Ask it how many files are in `tickets-q1/`. It will ask permission to run a command or two along the way — approve them. If it answers 200, you are ready for the morning.

## What you do not need

No Python. No `uv`, no `pip`, no virtual environment. No test framework. No paid anything.

The job today is reading a quarter of support tickets and writing a report, which is work rather than code. If you are a developer expecting to write software, adjust your expectations. If you are not a developer and you have been nervous about that, stop being nervous.

## Also worth having

- **Git.** On Windows, install [Git for Windows](https://git-scm.com/download/win) so the CLI's shell tools behave.
- **A text editor** you already like. Not required, since the agent edits files for you, but useful for reading diffs.
- **A pile of your own feedback**, anonymised, if you want to point the finished Skill at real data at the end. Optional.

## On the day

Arrive at full battery. Three hours of agent work will drain a laptop.

Bring your phone with a hotspot ready. Venue wifi is the most common failure, though the workshop material is all local, so a drop only affects the model calls.

## If something is broken that morning

Run `agy --version` and `agy models` and read the output. If it does not fix itself, message the facilitator the **exact** error text rather than a description of it.

Do not turn up with nothing installed. There are twenty-odd people and one facilitator, and one broken laptop eats ten minutes of everybody's session.

[← Back to home](index.html)
