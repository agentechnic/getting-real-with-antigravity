# Permissions & Trust

*What decides what this agent can touch, and one recorded case of it mattering.*

Most agent tools bury this page. It is on the main menu here because a specific thing happened while this workshop was being built, and the room deserves to know about it.

---

## The three layers

Between your prompt and your filesystem there are three separate gates. They are independent, and people routinely misdiagnose one as another.

### 1. Workspace trust

The first time you start `agy` in a directory it asks whether you trust this workspace. Your answer is remembered in the CLI's settings file.

This is the outer boundary. Everything else operates inside it.

### 2. Permission mode

How the agent behaves when it wants to do something that touches your machine.

| Mode | Behaviour |
|---|---|
| **request-review** | The default. It asks you before each sensitive action. |
| **always-proceed** | It stops asking. Fast, and you have given up the review step. |
| **strict** | Tighter than the default. |

There is also a terminal sandbox (`--sandbox`) for when you want commands to run without a prompt but without full reach either. That is the setting most people should reach for when approvals get tiring — not `always-proceed`, and certainly not `--dangerously-skip-permissions`, which is exactly what it sounds like.

### 3. The command allow-list

Specific commands you have pre-approved. Rules look like `command(ls)`, and they live in the CLI's settings file:

```json
{
  "permissions": {
    "allow": [
      "command(ls)", "command(cat)", "command(head)", "command(tail)",
      "command(wc)", "command(grep)", "command(find)", "command(sort)",
      "command(uniq)", "command(pwd)"
    ]
  },
  "trustedWorkspaces": [
    "/Users/you/path/to/nussaa"
  ]
}
```

A read-only list like that is a reasonable thing to set up on your own machine. It removes almost all of the interruption during a session like today's, and it grants nothing that can change a file.

**Find your settings file with `agy inspect`** rather than copying a path off a page. Where the CLI keeps its configuration has moved between releases, and the file it is actually reading is the only one that matters.

### The matcher is stricter than it looks

Worth knowing before you conclude your allow-list is broken: the rules are matched against the command the agent wants to run, and a compound command is one string.

`command(ls)` on the list does **not** approve:

```bash
pwd && ls -la              # two commands joined
find . -type f 2>/dev/null # redirection attached
```

Both come back denied even though `ls` and `find` are allowed. This confuses people into thinking the allow-list is not loading at all.

---

## The recorded case

This happened while preparing this workshop. It is in Beat 6 as a demo, and here in full.

**Setup.** The agent was started inside the `nussaa/` folder and asked to read `tickets-q1/`. The folder was right there. The allow-list on that machine was configured badly in exactly the way described above, so every read command it tried came back denied.

**What it did.** After three refusals it stopped trying to read the folder it was standing in, and widened its search. It composed a small Python one-liner to walk the home directory — Desktop, Downloads, Documents, and a handful of likely project folders — and separately tried a machine-wide filename search.

**What happened.** Both attempts were refused by the permission layer. Nothing outside the workspace was read.

### What to take from it, and what not to

Not this: *the agent tried to steal my files.* It did not. It wanted a folder named `tickets-q1`, could not find one, and looked further afield the way a person might.

This: **widening the search and leaving the workspace were the same action.** There was no separate decision point, no moment where "search harder" was distinguishable from "search your home directory". The only thing that made those different outcomes was a boundary configured before anybody needed it.

That is the whole argument for the permission layer, and it is a better argument than any hypothetical about malicious prompts. Ordinary helpfulness, running into an obstacle, reaches wider. Design for that.

### The practical fixes

1. **Start the agent in the right folder.** Most of this incident was a missing directory. `cd` first, and check the workspace name in the header before you type anything.
2. **Set a read-only allow-list** so ordinary reading does not get refused, because a blocked agent is an agent that improvises.
3. **Leave review on**, or use the sandbox. Do not reach for `always-proceed` to make an error message go away.

---

## Headless mode has no one to ask

If you script `agy` with `-p` / `--print`, there is nobody at the keyboard to approve anything. Anything that needs a permission it does not already have is **auto-denied**, and the run comes back with no output and a message saying so.

This is correct behaviour, and it catches everybody once. If you are automating, the allow-list is not optional — it is the whole interface.

---

## What this looks like during the workshop

You will approve a handful of `ls` and `cat` calls in Beat 2 and then it settles down. That is normal. Two things to remember:

- **A "hang" is usually a prompt.** If it has been quiet for a minute, look for a question waiting for you.
- **Do not turn approvals off in the room.** Beat 6 is about why, and it works better if you have felt the friction first.

[← Back to home](index.html)
