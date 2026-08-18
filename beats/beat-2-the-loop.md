# Beat 2 — The Loop

**Duration:** 20 minutes

**Goal:** Same job, same folder, same model. Everyone watches it read all 200 tickets.

<!-- participant-start -->
## Same job, different shape

```bash
cd nussaa     # wherever you unzipped it
agy
```

Check the folder name in the header before you type anything. If it does not say `nussaa`, quit and `cd` properly. An agent that cannot see `tickets-q1/` in front of it will go looking for it somewhere else, and you do not want to watch that today.

Now ask for the same thing you just failed to get:

```text
Read every ticket in tickets-q1/ and tell me what the main
themes are. Give me a count for each one.
```

Watch what it does before you read what it says. It asks to run `ls`. It asks to read files. You approve, and it goes. You are not pasting anything.

## The approvals are part of the demo

This CLI reaches for shell commands to do its reading, so you will approve a few before it gets going. Two things to notice while you click through them:

- **You can read every command before it runs.** That is not friction for its own sake. You are looking at the exact reach the agent is asking for, one line at a time.
- **The approvals stop once the pattern is established.** If you want them to stop sooner, there is a settings file that pre-approves read-only commands like `ls`, `cat`, `wc` and `grep` — see [Permissions & Trust](viewer.html?file=resources/permissions-and-trust.md).

Leave the approvals on today. Beat 6 shows you what they are for.

## What just happened

The Antigravity CLI runs a loop, and the loop is the whole product:

1. **It reads context.** Your message, plus `AGENTS.md`, plus any file it has opened.
2. **It acts through tools.** Read a file, search a folder, run a command, write a file. You see each one before it happens.
3. **It stops for you.** Then round again.

### The part people miss

Step 1 runs on *every single turn*, not once at the start. Which gives you the one habit worth taking home:

> **You steer it by editing files, not by arguing in chat.**

Correct it in conversation and the correction dies with the session. Write the same correction into `AGENTS.md` and it gets re-read every turn, forever. When something goes wrong today, your first question should be *which file is wrong?* rather than *how do I re-word this?*

## Look at what it already knew

Open `AGENTS.md` in the folder. Read it.

Nobody told the agent in the chat that the tickets are bilingual, or that "ما لقى العنوان" and "driver couldn't find building" are the same complaint. That file did. You have been working with a colleague who read the handbook before you arrived.

That file is four minutes of writing. It is doing more work than any prompt you will type today.

**Why `AGENTS.md` and not some tool-specific filename?** Because it is a convention several agent tools now read, so the same file works in more than one place. This CLI also reads `GEMINI.md` and anything under `.agents/rules/`. One folder, one set of conventions, whatever you drive it with.

## One thing to try before we move on

Ask it something the chat box could not answer:

```text
How many tickets contain Arabic script? And how many are written
entirely in Arabic?
```

Two different numbers, and the gap between them is the code-switching. A chat window can only answer for whatever you pasted into it.

It can count, because it can read. Hold on to how ordinary that felt.
<!-- participant-end -->

## Facilitator

Twenty minutes. Ten of it is people watching output scroll, which is fine.

### Project your own terminal for the first run

They need to see the tool calls and the approval prompts go past, not just the answer. The visible commands are the whole contrast with Beat 1.

### Check every laptop is inside `nussaa/`

Do this before anyone types the prompt. It takes two minutes of walking the room and it prevents the single ugliest failure mode of the day: an agent that cannot find `tickets-q1/` starts hunting for it, and what it tries next is a conversation you want to have on your terms in Beat 6, not by accident in Beat 2.

### Where the beat lands

The moment the first person says "it's done". Ask the room how long that took. Compare it to fifteen tickets pasted by hand. Do not labour it, the arithmetic does the work.

### Two things to say out loud, and only these two

1. About seven minutes in: *"Notice you did not tell it the tickets were in Arabic. Something else did."* Then open `AGENTS.md` on the projector.
2. About fifteen minutes in: *"Everything it knows about your job is in a file you can edit. That is the whole trick."*

### Expect these questions

**"So is this just a chatbot with file access?"** Yes, and the honest answer is that file access changes what kind of work you can hand it. Do not oversell it into something mystical.

**"Why does it keep asking me to run `cat`?"** Because that is how it reads. Answer plainly, then point at the settings file at the break rather than derailing the beat. Do not let anyone turn permissions off in the room.

### Do not let anyone start the report yet

The counts they get here will be rough and that is correct. Beat 3 is where they do it properly, with a plan they read first.

### Watch for

Anyone whose first run produced a confident answer with no counts. Flag it quietly. They will need it in Beat 3 and it is a good private example of a plausible answer that is not checkable.

[← Back to home](index.html)
