# Plan Mode Walkthrough

Plan Mode is not a feature. It is the workflow: start in a plan, iterate until the plan is right, then let it run.

That sequence is what you are learning today.

## What Plan Mode actually does

With Plan Mode on, the agent's job changes. Instead of doing the work, it:

- Reads files
- Searches the folder
- Asks you questions
- Produces a written plan

No edits, no build, no report. You get a numbered plan and nothing else until you approve.

## How to enter it

Two ways, and they are equivalent:

**From inside a session:**

```text
/plan
```

**When you start one:**

```bash
agy --mode plan
```

The second is useful when you know the whole session is a planning session. `agy --mode accept-edits` is the opposite end — it stops asking before each edit — and is the mode to switch to *after* you have read and approved a plan, not before.

## The loop, slowly

Walk this script the first time you do it. It becomes muscle memory after two or three sessions.

### 1. Open the folder, start the agent

```bash
cd nussaa
agy
```

Accept the workspace-trust prompt if this is a new folder. Check the header says the folder you meant.

### 2. Enter Plan Mode

```text
/plan
```

### 3. Let it read the room

```text
Read AGENTS.md and the context folder, then tell me what you
understood about how I want this work done.
```

It reads back what it took from your rules. **If the readback is wrong, the file is wrong.** Fix the file, not the prompt. This is thirty seconds that saves you an argument later.

### 4. Ask for a plan

```text
Read the Q1 tickets and work out the themes with exact counts. Write
the result to themes-2026-q1.md, matching the format of
context/themes-2025-q4.md.
```

It reads, thinks, and produces a numbered plan.

### 5. Read the plan, line by line

Out loud if you are alone. With a colleague if you are not. The discipline you are building is *reading* the plan, not approving the plan.

What you are looking for today:

- **Is it going to count, or sample?** "Review a representative selection" gives you a confident number that is wrong. This is the single most common flaw in a plan for this task.
- **Does it open the changelog?** A plan that never reads `context/changelog.md` cannot find a cause, only symptoms.
- **Does it match the existing report format**, or invent its own?
- **Is there anything in the plan you did not ask for?** Push back before anything is written.

### 6. Push back

Just say what is wrong:

```text
Step 3 says sample the tickets. Count every one of them.
```

You get a revised plan. Repeat until it says what you meant.

### 7. Approve and let it run

Exit Plan Mode and tell it to go. Watch the diffs as they come past — you do not need to read every line, you are looking for anything that does not belong. `/diff` catches you up if the output scrolled.

### 8. If it drifts mid-build

Go back into Plan Mode and re-plan from where it actually is:

```text
The report has drifted from step 4 of the plan. Re-plan from the
current state to finish it.
```

You get a new plan. You read it. You approve it. The loop continues.

## When to use Plan Mode and when not to

**Always:**
- Anything that writes a file you care about
- Anything spanning more than one step
- Anything you would want reviewed before it was real

**Skip it:**
- "How many files are in this folder?"
- One-line corrections
- Exploring an unfamiliar folder with no edits

**The right default for today is Plan Mode for the whole build block.** The point is not speed this morning. It is the habit.

## Correct via files, not arguments

If the agent keeps making the same mistake — wrong grouping, wrong format, estimating instead of counting — the fix is a line in `AGENTS.md`, not a longer prompt next time.

Files persist across turns. Prompt arguments evaporate.

This is the same reason Plan Mode works: both are ways of getting agreement *before* the work exists, in a form that survives.

## The collaboration model

A genie executes wishes. You say "tell me the themes" and it tells you something. You get what it produced, not necessarily what you asked for.

A collaborator works from a brief. You write the conventions down, it produces a plan, and you read the plan together. If the plan is wrong, you catch it before any file is written. If the work drifts, you re-plan.

This is why *reading* the plan matters more than *approving* it. The habit you are building is: **before it writes a single file, I know exactly what it is going to write and why.**

## A note on speed

Plan Mode feels slow the first three times you use it. You write a plan, you read a plan, you edit a plan — none of which is "output being produced".

After the third project, the calculation flips. Two minutes of planning saves twenty minutes of unwinding the wrong report. You start to feel impatient *without* a plan.

That impatience is the point.

[← Back to home](index.html)
