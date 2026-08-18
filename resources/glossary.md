# Glossary — Plain-Language Definitions

Every term used in this workshop, defined for people who do not write software. Use it as a reference during any beat.

---

## The four pieces

**Skill**
A folder with a `SKILL.md` inside it, describing a job you want done and how you want it done. The agent reads the description of every Skill at the start of a session and loads the ones that match what you asked for. It also appears as a slash command you can call directly. Write it once, and next quarter the work starts with the instructions already in place. This is what you take home today. Lives at `.agents/skills/<name>/SKILL.md`.

**Subagent**
A separate session with its own memory, launched by the one you are talking to. It knows nothing about your conversation, which is exactly why it is useful: it is the only thing that can honestly tell you whether your instructions make sense to someone who was not there when you wrote them. Declared as a file at `.agents/agents/<name>.md` with `subagent: true` in the frontmatter.

**MCP server (Model Context Protocol)**
An open standard for connecting an AI to something outside its folder. One server grants one capability, like driving a browser tab or querying a database. The point is that you choose what to grant. An agent with an MCP server for a browser has a browser, and nothing else. Configured in `mcp_config.json`.

**Plugin**
A bundle of rules, Skills, subagents and MCP servers, versioned and installable in one step. How a habit that works on your laptop becomes how your team works. Lives at `.agents/plugins/<name>/` and is checked with `agy plugin validate`.

---

## How the CLI behaves

**agy**
The Antigravity CLI. The command you type to start an agent session in the current folder. Same agent harness as the Antigravity IDE, without the IDE.

**Agentic loop**
The cycle the CLI runs every turn: read your rules files, act through tools, show you what it did, wait for you. Not a chatbot that answers questions. It reads, acts, and pauses.

**AGENTS.md**
A plain-text instruction file in your project folder. The agent reads it at the start of every turn, not just the first. Your conventions live here: how to group things, what to never assume, what to ask about. Think of it as the onboarding memo for a colleague who re-reads it constantly. `GEMINI.md` and `.agents/rules/*.md` do the same job.

The practical consequence is the main lesson of the day. Correct the agent in conversation and the correction dies with the session. Write the same correction into `AGENTS.md` and it holds forever.

**Plan Mode**
A mode where the agent writes you a numbered plan instead of doing the work. Turn it on with `/plan`, or start the session with `agy --mode plan`. You push back on anything wrong, then approve. Talk before touching anything.

**Accept-edits mode**
The opposite. The agent works through its plan without stopping after each edit. You switch into it once you have approved a plan you actually read. `agy --mode accept-edits`.

**Tool**
Something the agent can do: read a file, edit a file, run a shell command, search a folder. You see each call before it happens.

**Permission prompt**
The question the CLI asks before running something that touches your machine. Approving one is not a formality — it is the moment you can see the exact reach being requested. A session that looks frozen is usually one waiting for an answer.

**Workspace trust**
The one-off question asked the first time you start the agent in a folder. Your answer sets the outer boundary of what it can reach, and it is remembered.

**Allow-list**
Commands you have pre-approved so they stop interrupting you, written as rules like `command(ls)` in the CLI's settings file. Note that it matches the whole command, so a chained command like `pwd && ls` is not covered by a rule for `ls`.

**Context window**
How much text the agent can hold at once in a session. Working memory. When your files and conversation history fill it, the oldest parts fall out. This is why a short focused `AGENTS.md` beats a long thorough one, and why a subagent starting fresh is genuinely a fresh start.

**Effort**
A setting on thinking models controlling how much reasoning they do before answering. More effort costs more of your quota. Most jobs do not need the maximum.

**Quota pool**
Your free-tier allowance, which comes in two independent buckets — one for Gemini models, one for Claude and GPT models — and refreshes weekly. Check it with `/usage`.

---

## Terms from the task

**Theme**
A group of tickets complaining about the same thing, whatever language they used. *"ما لقى العنوان"*, *"driver couldn't find building"* and *"الـ pin ودى الكابتن لحي ثاني"* are one theme, not three. Grouping by language would produce fake themes and hide a real one.

**Colloquial and fusha**
Fusha is formal written Arabic, the kind used in official complaints and news. Colloquial is how people actually type. The tickets contain both, because real queues contain both. The same customer might write نص ساعة casually and نصف ساعة when they are annoyed enough to be formal.

**Code-switching**
Using two languages in one sentence, usually an Arabic frame with English product words dropped in: *"الـ app يطفي كل ما افتحه"*. Extremely common in Riyadh and completely normal. It is not broken Arabic or broken English.

**Signal**
Something in the data that points at a cause rather than describing a symptom. A pile of complaints is symptoms. A pile of complaints that all start the week after a release is a signal.

---

## Terms from the tools

**Terminal**
The window where you type commands instead of clicking. On a Mac, press Cmd+Space and type "Terminal". On Windows, search for PowerShell. If you can open one and type `ls`, you are ready for today.

**Repository (repo)**
A folder of files tracked by git, usually shared online. Cloning one copies it to your machine.

**Markdown**
Plain text with light formatting marks: `#` for a heading, `**bold**`, `-` for a bullet. Every file you read and write today is markdown. It stays readable even without anything to render it.

**YAML frontmatter**
The block at the top of a file, fenced by `---` lines, holding structured settings — a Skill's `name` and `description`, a subagent's `subagent: true`. Get it wrong and the file may not register at all.

**Diff**
The change the agent is proposing, shown as lines added and lines removed. Green is added, red is removed. Reading diffs is how you check work before it becomes permanent. You do not need to read every line, only look for anything that does not belong. `/diff` shows you the current one.

**Cold start**
Running something with no prior context. Your Skill working when you run it means little, because you remember what you meant. Your Skill working cold means it is actually written down.

---

*Something missing or still unclear? Tell the facilitator, and it goes in the next version.*

[← Back to home](index.html)
