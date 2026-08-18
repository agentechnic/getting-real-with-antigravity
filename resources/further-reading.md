# Further Reading

Curated. Current as of August 2026. Each link is something worth sending to a friend, not a comprehensive index.

## The official sources

- **Antigravity** — [antigravity.google](https://antigravity.google/)
- **Antigravity docs** — [antigravity.google/docs](https://antigravity.google/docs)
- **Plugins & Skills reference** — [antigravity.google/docs/cli/plugins](https://antigravity.google/docs/cli/plugins)

The docs are the source of truth for file paths and command syntax, both of which have moved between releases. When a path on any page — including this one — disagrees with what `agy inspect` reports on your own machine, believe your machine.

## The codelabs

Google's own hands-on material. Between them they cover the features properly; none of them cover the harvest-and-cold-test move this workshop is built around, which is why this workshop exists.

- **Getting Started with Google Antigravity** — [codelabs.developers.google.com/getting-started-google-antigravity](https://codelabs.developers.google.com/getting-started-google-antigravity)
- **Authoring Google Antigravity Skills** — [codelabs.developers.google.com/getting-started-with-antigravity-skills](https://codelabs.developers.google.com/getting-started-with-antigravity-skills)
- **Spec-Driven Development with Antigravity CLI** — [codelabs.developers.google.com/sdd-agy-cli](https://codelabs.developers.google.com/sdd-agy-cli). Skills plus MCP, structured workflows. The closest official material to today's Beat 3 and Beat 6.
- **Autonomous developer pipelines with AGENTS.md and skills** — [codelabs.developers.google.com/autonomous-ai-developer-pipelines-antigravity](https://codelabs.developers.google.com/autonomous-ai-developer-pipelines-antigravity)

## On the AGENTS.md convention

- **agents.md** — the cross-tool convention for a rules file. Worth reading once, because the file you write tonight is not specific to one vendor's CLI, and that is a large part of why it is worth writing.

## On agents in general

Tool-agnostic and still the best short reading on why any of this is shaped the way it is.

- **"Building effective agents"** (Schluntz and Zhang, Anthropic, December 2024) — [anthropic.com/engineering/building-effective-agents](https://www.anthropic.com/engineering/building-effective-agents). The single best summary of the patterns: prompt chaining, routing, parallelisation, orchestrator-workers, evaluator-optimiser. Read it before you design your second Skill.

## On MCP

- **MCP spec home** — [modelcontextprotocol.io](https://modelcontextprotocol.io)
- **Official MCP server registry** — [github.com/modelcontextprotocol/servers](https://github.com/modelcontextprotocol/servers). Browse it once. Seeing how narrow a good server's scope is teaches the Beat 6 argument faster than any explanation.

## On evals and verification

Beat 5 is a hand-rolled eval. If you want the discipline behind it, the canonical reading is Hamel Husain. Do not read everything — read these two, in order:

- **"Your AI Product Needs Evals"** — [hamel.dev/blog/posts/evals/](https://hamel.dev/blog/posts/evals/). Thirty minutes. Read first. Read once a quarter.
- **"Using LLM-as-a-Judge For Evaluation"** — [hamel.dev/blog/posts/llm-judge/](https://hamel.dev/blog/posts/llm-judge/). Read second, when a single cold run stops being enough.

## The reading order if you have one weekend

1. Do the **Authoring Skills** codelab (an hour, hands on).
2. Read **"Building effective agents"** (20 minutes).
3. Read **Hamel's "Your AI Product Needs Evals"** (30 minutes).
4. Take one job you do every month, harvest a Skill from it, and send a subagent at it.

Step four is the one that changes anything.

[← Back to home](index.html)
