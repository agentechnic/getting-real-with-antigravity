# The Material

One folder, no git required.

## Get it

**[Download nussaa.zip](nussaa.zip)**

Unzip it anywhere you like, then:

```bash
cd nussaa
ls
```

You should see `tickets-q1`, `tickets-q2`, `context`, `AGENTS.md` and `README.md`.

Then check the CLI can see it:

```bash
agy
```

Accept the workspace-trust prompt, then ask how many files are in `tickets-q1/`. Approve the read commands it asks for. If it answers 200, you are ready.

**Start it from inside `nussaa/`.** This matters more than it looks. An agent that cannot see `tickets-q1/` in front of it will start hunting for a folder by that name somewhere else, which is a demonstration you want on the projector in Beat 6, not on your own laptop by accident.

## What is in it

```
tickets-q1/    200 support tickets, one per file
tickets-q2/    120 more, from the quarter after
context/
  changelog.md         what shipped, and when
  themes-2025-q4.md    last quarter's report
AGENTS.md      the conventions the agent works to
README.md      what this is
```

The whole of `tickets-q1/` is about 38KB of text. Worth knowing, because somebody always assumes the limit today is the model's memory. It is not.

### About that filename

`AGENTS.md` is a shared convention rather than a product feature — several agent tools read a file by that name, so the same conventions work in more than one place. This CLI also reads `GEMINI.md`, and anything you put under `.agents/rules/`.

## The company

Nussaa (نص ساعة, "half an hour") is a food delivery app in Riyadh. The name is the delivery promise, which is the kind of thing a confident startup does.

You are its support lead. Someone has handed you a quarter of complaints and asked what the themes were.

Nussaa does not exist. Its restaurants, riders and customers were invented for this workshop. You can see the company at [agentechnic.github.io/nussaa](https://agentechnic.github.io/nussaa/), which is also invented.

## The tickets

They are messy on purpose, in the specific ways a real queue is messy.

**Three languages, often in one ticket.** Colloquial Saudi Arabic as people actually type it, with inconsistent spelling and no diacritics. Fusha in the longer formal complaints. English, some fluent and some not. And code-switching, which is the common case.

That matters more than it sounds. The same complaint shows up as *"ما لقى العنوان"*, as *"driver couldn't find building"*, and as *"الـ pin ودى الكابتن لحي ثاني"*. A correct analysis groups all three. Grouping by language would produce three fake themes.

**Some of them are useless.** One line, no detail. Real queues are full of these.

**Some are duplicates.** Someone hit send twice.

**A few are jokes.** The company is called "half an hour" and their food took two, and one or two customers could not resist. Those are real complaints and jokes at the same time, which is also true of real queues.

## What you produce

`themes-2026-q1.md`, matching the format of `context/themes-2025-q4.md`.

Read that file before the session. It is short, it is the format you will be matching, and knowing it in advance saves you ten minutes in the middle of the day.

## Nothing here needs the internet, except the model

The tickets are on your disk and the analysis writes back to your disk. Only the model calls go out. If the venue wifi wobbles, you lose the turn, not the work.

[← Back to home](index.html)
