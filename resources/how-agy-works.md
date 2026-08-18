# How the Antigravity CLI Actually Works

*For anyone who wants the theory behind what they are being asked to do.*

---

## The loop

`agy` is not a chatbot with a terminal attached. It runs a loop, and the loop is the product.

Each turn:

1. **It reads context.** Your message, `AGENTS.md`, and any file it has opened. This happens on *every* turn, not once at the start.
2. **It acts through tools.** Read a file, edit a file, run a shell command, search a folder. You see each call before it executes, and on anything that touches your machine it waits for you.
3. **It stops for you.** Then round again.

```mermaid
flowchart LR
    msg(["Your message"]) --> read["Read context\nAGENTS.md · open files"]
    read --> act["Act through tools\nRead · Edit · Shell · Search"]
    act --> review(["Your review"])
    review -->|next turn| read
```

**The implication people miss:** you steer it by editing files, not by arguing in chat. A line in `AGENTS.md` saying *"group tickets by meaning, never by language"* does more work than a paragraph of explanation in a prompt, because it gets re-read every turn while your explanation scrolls out of memory.

### Where the rules come from

More than one file feeds that first box, and they stack:

| Source | Scope |
|---|---|
| `AGENTS.md` or `GEMINI.md` in the folder | this project, and nested folders can have their own |
| `.agents/rules/*.md` | this project, split into topics |
| A global rules file in your home config | every project you open |

Keep them short. There is a size ceiling on how much rules text gets loaded, and long before you hit it you have hit the more important limit — the model applies a finite number of instructions at a time, however many you write.

`agy inspect` shows you what your install is actually reading, which beats guessing.

### Plan Mode is enforcement, not etiquette

With Plan Mode on, the agent produces a plan instead of doing the work. It reads, searches, and writes the plan out for you.

You read the plan, push back, then approve.

```mermaid
flowchart TD
    on(["Plan Mode ON"]) --> locked["Read + Search only"]
    locked --> plan["The agent writes a plan"]
    plan --> review{{"You review"}}
    review -->|"push back"| plan
    review -->|"approve"| run["It runs"]
```

---

## The permission layer

This is the part of `agy` that differs most from other agent CLIs, and it is worth understanding rather than clicking through.

Three things gate what the agent can do:

1. **Workspace trust.** You are asked, once per directory, whether this folder is trusted. That is the outer boundary.
2. **Permission mode.** The default asks you to review each sensitive action. There are looser and stricter settings, and a terminal sandbox if you want speed without giving up containment.
3. **A command allow-list.** Specific commands you have pre-approved, so `ls` and `cat` stop interrupting you.

The practical effect is that a lot of this agent's file reading arrives as *shell commands you approve*, rather than invisible internal tool calls. That is more honest and more annoying, in that order.

Full detail, including a recorded case of the boundary doing its job: [Permissions & Trust](viewer.html?file=resources/permissions-and-trust.md).

---

## The three claims

### 1. Do the work once, then keep it

Getting a good answer out of an AI stopped being the hard part some time ago. Getting the same answer next quarter, without re-explaining yourself, is where the actual leverage sits.

A **Skill** is how that survives: a folder with a `SKILL.md` describing a job and how you want it done, with `name` and `description` in the frontmatter. The agent scans descriptions each session and loads the ones that match. It also surfaces as a slash command, so you can call it deliberately.

The trick this workshop teaches is that you do not write it from a blank page. You do the job first, then ask the agent to write down what you both just did. Everything it needs is still in its context: the corrections you made, the conventions you insisted on, the order you worked in.

### 2. You cannot test your own instructions

You wrote them, so you read straight past the step that only makes sense if you remember the conversation. This is the same reason writers cannot proofread their own work.

A **subagent** solves it structurally. It is a separate session with its own context window, declared as a file under `.agents/agents/`, and it knows nothing about your conversation. Send it at your Skill and ask what it had to guess. The guesses are the sentences you did not write.

Notice what that is: a test harness. You did not build one, you asked for an isolated run and read the complaints.

### 3. Give it the reach the task needs

An agent confined to a folder can do a lot, and everything in this workshop happens inside one.

When a task genuinely needs to reach further, an **MCP server** grants one specific capability. A browser. A database. A ticketing system. One server, one reach, declared in `mcp_config.json`.

The alternative on offer elsewhere is an agent with access to your whole machine. That is a real trade and worth making deliberately rather than by default.

---

## What a chat box structurally cannot do

Not a criticism of chat interfaces. They are the wrong shape for some jobs, and knowing which is the point.

### Work through a folder

A chat window takes one input at a time. You paste, it responds. There is no primitive for *"read all two hundred of these, including the ones that arrive next quarter."*

`agy` runs as a process on your machine and can read, write and search the filesystem. In this workshop that is the entire difference between beat 1 and beat 2.

### Remember anything

Close the tab and the work is gone. Next quarter you start from the first ticket, re-explaining the same conventions.

An `AGENTS.md` and a `SKILL.md` are both just files on disk, which means they persist, they can be version controlled, and they can be handed to somebody else.

### Produce the artifact

Whatever a chat tells you, you copy back out by hand into a document you make yourself. You remain the integration layer.

`agy` writes the file. That sounds small until you have done it both ways in the same morning.

---

## A useful way to hold it

Think of the agent as a capable colleague who started this morning. No context about your work, no knowledge of your preferences, no idea what "done" means here.

Given a clear brief written down where they can re-read it, they do exceptional work. Given a vague wish, they make reasonable guesses that compound into something you did not want.

So:

- **Brief it in a file**, once, rather than in every prompt.
- **Read the plan** before approving it. That is the habit, not approving.
- **Correct through files**, not arguments.
- **Have something check the result** that was not present when you did the work.

---

## Where to go deeper

The official Antigravity documentation and codelabs cover the features thoroughly — where files go, what commands exist, how plugins are structured. Start there for reference.

What they do not cover, and what this workshop is for, is the move in the middle: you did the work once, now make it repeatable, and find out whether it actually is.

[← Back to home](index.html)
