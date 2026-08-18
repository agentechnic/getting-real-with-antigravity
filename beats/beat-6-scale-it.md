# Beat 6 — Scale It

**Duration:** 10 minutes

**Goal:** Watch three short demos. Understand where the agent's reach comes from, where it stops, and how a Skill leaves your laptop.

<!-- participant-start -->
## Watch this one

Nothing to type. Ten minutes, front of the room.

## What happened when it could not find the folder

Start with a true story from building this workshop, because it is more useful than any diagram.

The agent was started in `nussaa/` and asked to read `tickets-q1/`. Every read command it tried was refused — the allow-list on that machine was configured badly, and the compound commands it reached for did not match any rule.

Three refusals in, it stopped trying to read the folder it was standing in. Instead it wrote a small Python script to walk the home directory — Desktop, Downloads, Documents, a handful of likely project folders — and separately tried a machine-wide file search.

**Both were refused by the permission layer. Nothing outside the folder was read.**

Nothing here was malicious. The agent wanted a folder called `tickets-q1`, could not see one, and widened its search the way a person might. The interesting part is not the intent, it is the reach: *widening the search* and *leaving the workspace* were the same action, and the only thing between them was a boundary somebody had configured.

> Your agent is only as contained as the thing you set up before you needed it.

That is the argument for the next two demos, and it is why nobody turned permissions off this morning.

## Reaching outside the folder, on purpose

Your report says complaints spiked after the address-picker release. A reasonable next question: is that a known problem with the mapping library the app moved to?

The agent cannot answer that. It is not in your folder, and everything today has come out of your folder.

So it gets given exactly one thing: a browser.

The facilitator connects the **Chrome DevTools MCP server** — a small block of JSON — and you watch a tab open and run a search on the projector.

```json
{
  "mcpServers": {
    "chrome-devtools": {
      "command": "npx",
      "args": ["-y", "chrome-devtools-mcp@latest"]
    }
  }
}
```

Now look at what it was handed. A browser tab. Not your files, not your mail, not your machine. It needed to reach one place, so it was given one place.

**That is the decision worth taking home.** There are agents that want your whole desktop. You can give an agent exactly the reach a task needs instead, and you should. MCP servers are how you do that: one server, one capability, scoped on purpose. `/mcp` shows you what is currently connected.

## Handing the Skill to someone else

Right now your Skill lives in `.agents/skills/` on your laptop. Useful to you, invisible to everyone else.

A **plugin** is a versioned bundle: rules, Skills, subagents, MCP servers, hooks, packaged together and installed with one command.

```
.agents/plugins/nussaa-analytics/
├── plugin.json
├── rules/
│   └── AGENTS.md
├── skills/
│   └── ticket-themes/
│       └── SKILL.md
└── mcp_config.json
```

Two commands matter:

```bash
agy plugin validate .agents/plugins/nussaa-analytics
agy plugin list
```

`validate` is the one that saves you the embarrassing demo. It reports what it found — `✔ skills: 1 processed`, `✔ mcpServers: 1 processed` — and fails loudly on a bundle that would silently do nothing.

Your teammate installs it, and now they analyse tickets the way you do. That is how a personal habit becomes how a team works.

## The four pieces

You have now met all of them. They are easy to confuse, and the difference is simple:

| Piece | What it is | Where it lives |
|---|---|---|
| **Skill** | Something you want the agent to know how to do | `.agents/skills/<name>/SKILL.md` |
| **Subagent** | Something you delegate to a clean context | `.agents/agents/<name>.md` |
| **MCP server** | A specific capability you choose to grant | `mcp_config.json` |
| **Plugin** | Those bundled, so somebody else installs them in one command | `.agents/plugins/<name>/` |

Every one of them is a file in a folder. Nobody wrote a framework today. You composed four existing pieces, and tested the result by asking for an isolated run.

> **Building harnesses without building them.** That is the whole idea.
<!-- participant-end -->

## Facilitator

Ten minutes, demo only. Do not let anyone install anything, that is a twenty-minute detour.

### Run the three in this order

The permission story first, because it is the one that earns the MCP demo. Then MCP. Then plugins. If you are short on time, cut plugins to sixty seconds — never cut the first one.

### Telling the containment story well

Tell it flat, with no drama, and be precise about the outcome: **the attempts were refused and nothing outside the folder was read.** Overstate it and you are scaremongering about a tool you just spent three hours recommending; skip it and you have taught a room of people to click Approve forever.

The line that lands:

> *"It was not doing anything sinister. It wanted a folder, could not find it, and looked wider. That is exactly the behaviour a boundary exists for — and the boundary held because somebody set it up before it was needed."*

Expect the question: *"So should I turn permissions off?"* The honest answer is that the read-only allow-list is fine and most people should set one, that the always-proceed mode is a real setting with a real cost, and that the terminal sandbox exists for when you want speed and containment at once. Point at [Permissions & Trust](viewer.html?file=resources/permissions-and-trust.md) and move on.

### Setup before the session

**Do this the night before, not on the morning.** A demo that fails here undercuts the exact argument you are making.

```bash
node -v      # must be >= 22.12 for chrome-devtools-mcp
```

Add the MCP server through a config file, start a **fresh** session — MCP servers start when the session does, so reloading is not enough — and confirm with `/mcp` that the server is listed *and its tools are callable*. Registered with zero tools means the server started and exited immediately, and the cause is almost always Node.

Rehearse the whole demo once end to end: connect, open a tab, run the search, read the result. Know how long it takes so you are not narrating dead air.

**If it will not work on the day, do not improvise.** Say what the demo would have shown and move to plugins. The scoping argument survives being described; a broken terminal in front of the room does not.

### Running the MCP demo

The setup comes out of their own work, which is what makes it land. Say roughly:

> *"Your report says complaints spiked after v4.2. Is that a known issue with the map library? It cannot know. It is not in the folder."*

Then connect it, run the search, and let the tab open where they can see it.

Then the line the whole demo exists for:

> *"Look at what it just got. A browser tab. Not my files, not my mail, not my machine. It needed to reach one place, so I gave it one place."*

Pause there. Do not rush into plugins.

### Plugins

Two minutes. Show the folder layout and run `agy plugin validate` on the prepared bundle so they see it pass. Do not demo an install unless you have one ready and tested.

If somebody in the room already has a plugin built for a different agent CLI, mention `agy plugin import` in one sentence and take it offline. It is a good conversation and a terrible use of the last five minutes.

The point is only that the Skill they built this morning can leave their laptop.

### Closing this beat

The four-way summary is the day's argument compressed. Say it slowly, then stop:

> *"Skill, subagent, MCP, plugin. Four files in four folders. Nobody wrote a framework today. You composed four things that were already there, and you tested it by asking for a clean run."*

[← Back to home](index.html)
