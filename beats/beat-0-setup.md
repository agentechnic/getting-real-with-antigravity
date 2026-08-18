# Beat 0 — Setup

**Duration:** 30 minutes

**Goal:** Every laptop can run `agy` inside the `nussaa/` folder before anyone talks about anything.

<!-- participant-start -->
## Before we start

Two checks. If both work, you are ready.

```bash
agy --version      # prints 1.1.x
agy models         # lists the models your account can reach
```

There is no `agy doctor`. If the CLI is not installed yet, `agy install` sets it up; the second command above is the real health check, because it only answers once you are signed in and your account is eligible.

Then get the material. Download **[nussaa.zip](https://github.com/agentechnic/nussaa-tickets-corpus/releases/download/v1.2.0/nussaa.zip)**, unzip it, and:

```bash
cd nussaa
ls
```

You should see `tickets-q1`, `tickets-q2`, `context`, `AGENTS.md`, `CLAUDE.md` and `README.md`.

Two rules files, and they are the same file. `agy` reads `AGENTS.md`; Claude Code reads `CLAUDE.md` and ignores `AGENTS.md`. The corpus ships both so the folder works with either tool. **Today you care about `AGENTS.md`** — leave the other one alone.

If something is red, say so now. At minute forty everyone else will be building and you will be installing.

## Two things that surprise people on first launch

**1. It asks whether to trust this folder.** The first time you start `agy` in a directory it asks you to trust the workspace. Say yes for `nussaa/`. That answer is remembered, and it is the outer boundary of what the agent can reach — worth knowing you were asked.

**2. It asks permission to run commands.** This CLI does a lot of its file reading by running shell commands, so you will see approval prompts like `ls tickets-q1` or `cat tickets-q1/NUS-00001.md` before it does anything. Approve them. That is not the tool being broken, it is the tool showing you its hands.

If the prompts get tedious, read [Permissions & Trust](viewer.html?file=resources/permissions-and-trust.md) at the break — there is a settings file that pre-approves read-only commands. Do not turn approvals off entirely today. Beat 6 is about why.

## Check your quota before you start

```text
/usage
```

You are on the **Antigravity Starter Quota** — the free tier — unless you pay for something. It gives you two separate weekly pools: one for Gemini models, one for Claude and GPT models. Note roughly where they are now. You will look again at the end of the day, and the difference is the true cost of a session like this.

## What you are here to be able to do

**By the end you can take a folder of messy real work, direct the agent to research, analyse and produce a finished artifact from it, then turn that whole workflow into a Skill that fires by itself next time. And you can prove the Skill works, because you tested it in a clean context.**

That last sentence is the part almost nobody teaches. Plenty of people can get an AI to produce something once. Doing the same work next month without starting over is a different skill, and it is the one worth three hours.

## What is in the folder

You are the support lead at Nussaa, a food delivery app in Riyadh. Nussaa means نص ساعة, half an hour, which is the delivery promise the company named itself after.

Someone has handed you a quarter of customer complaints and asked what the themes were.

```
tickets-q1/    200 support tickets, one per file
tickets-q2/    120 more, from the quarter after
context/       the product changelog, and last quarter's report
AGENTS.md      the conventions you work to
```

The tickets are messy. Some are one useless line. Some are duplicates. They arrive in Arabic, English, and both at once, because that is what a Riyadh support queue looks like.

Nussaa is not a real company. Nobody was harmed in the making of these complaints.

## While you wait

Open `context/themes-2025-q4.md` and read it. That is last quarter's report, written by whoever had your job before you. You will be matching its format later, so knowing what it looks like now saves you ten minutes in the middle of the day.
<!-- participant-end -->

## Facilitator

Thirty minutes for setup sounds generous until two people arrive with an account that will not sign in.

### Run this yourself first

On a clean machine, before the session: `agy --version`, `agy models`, download the zip, unzip, `cd nussaa`, `agy`, accept the workspace-trust prompt, ask it to count the files in `tickets-q1/`. That is the whole check. If anything is missing, nothing else in the day works.

### The failure that will actually bite you: the account

This is the single biggest difference from running the same workshop on a different CLI, and it is not a technical problem you can fix in the room.

**Corporate and Google Workspace accounts frequently cannot use the Antigravity CLI.** Access to experimental AI developer tooling is an admin-controlled setting, and in most organisations it is off. The attendee sees an eligibility or sign-in error, not a helpful one.

So put this in the event communications, in bold, a week ahead:

> Sign in with a **personal** Google account. Work accounts are usually blocked, and we cannot unblock them on the day.

Ask for a show of hands at the start of Beat 0 anyway. Anyone still stuck at minute fifteen pairs with a neighbour for the rest of the day. Do not spend the room's setup window on one admin console you do not control.

### Common failures, in the order you will see them

1. **Signed in with a work account.** No fix in the room. Personal account, or pair up.
2. **`agy` not on PATH after install.** Restart the shell first; that is usually it.
3. **Ran `agy` from the repo root instead of `nussaa/`.** The whole session assumes you are inside `nussaa/`, and an agent that cannot see `tickets-q1/` in front of it goes looking elsewhere. Check this one by eye, on every laptop, before Beat 2.
4. **Permission prompts read as errors.** Somebody will say it is "stuck". It is waiting for them.

Nobody needs Python today. If somebody starts installing it because they assumed a workshop means code, stop them.

### What to do with the room while you wait

- Ask who has used an agent CLI before today. Never, a few times, most days. Remember the split, it tells you how hard to push in Beat 3.
- Point people at `context/themes-2025-q4.md`. It gets them reading the material before the clock starts.
- Get everyone to run `/usage` and write the two numbers on a sticky note. Beat 7 uses them.

**Do not** start Beat 1 for latecomers. Hand them a neighbour and carry on.

[← Back to home](index.html)
