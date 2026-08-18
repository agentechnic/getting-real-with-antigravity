# Antigravity CLI dry run — record

**Date:** 2026-08-18
**CLI:** `agy` 1.1.13 / 1.1.14, free-tier personal Google account
**Verdict: the workshop ports.** Every beat was executed end to end on `agy`.
The planted signal was found unaided, the harvested Skill survived a cold run
on Q2 without inheriting Q1's story, and the plugin bundle validated.

This is the record of what actually happened, including what broke. The
generator's ground truth is in `nussaa-answer-key.md`; the two do not match,
and the gap is the point.

---

## What was run

The full lifecycle: read the Q1 corpus, produce the themes report, harvest the
procedure into a Skill, run that Skill cold on Q2 with an isolated subagent,
package the result as a plugin and validate it.

## Beats 2 and 3 — the work

All 200 bilingual tickets in `tickets-q1/` were read individually. Nothing was
sampled.

It found the signal: **v4.2, shipped 2026-02-11, replacing free-text address
entry with a map-pin picker**, matching the driver-address cluster against
`context/changelog.md`. It placed 4 tickets before the release and 29 after.

It produced `themes-2026-q1.md` matching the layout, table headers, Arabic
quote handling and recommendations structure of `context/themes-2025-q4.md`
without being shown an example beyond that file.

### The counts will not match, and that is correct

| | Generator | `agy` run |
|---|---|---|
| Late delivery | 55 | 53 |
| Wrong or missing items | 38 | 38 |
| Driver could not find the address | 36 | 33 |
| Pre-release / post-release split | 4 / 32 | 4 / 29 |

Clustering is a judgement call, and a second analyst differs again. This is
the same finding the original Claude Code dry run produced, which is
reassuring: the variance is in the task, not the tool.

**Do not mark attendees against the answer key.** What matters is that the
report finds the theme, states a count it can defend, and connects it to v4.2
by date.

## Beat 4 — the harvest

Harvested cleanly into `.agents/skills/ticket-themes/SKILL.md` with YAML
frontmatter (`name`, `description`), parameterised quarter input, and explicit
counting rules. It registered as a slash command.

## Beat 5 — the cold run

An isolated subagent with no conversational context ran the harvested Skill on
`tickets-q2/` (120 tickets).

**It did not inherit Q1's story.** It reported:

| Theme | Tickets | Share |
|---|---|---|
| Payment failed or double charged | 33 | 28% |
| Refund not received | 29 | 24% |

— together 52% of the batch — and tied the spike to the **v4.5 payment
provider migration on 2026-04-14**. Address-pin complaints fell to 6%.

Compare the answer key's generator figures (35 / 29.2% and 25 / 20.8%). Same
story, different arithmetic, again.

### The two pieces of friction it reported

Both are exactly what Beat 5 is designed to surface:

1. **Which report is the baseline?** Both `context/themes-2025-q4.md` and the
   `themes-2026-q1.md` written that morning now exist, and the Skill did not
   say which to compare against. This ambiguity did not exist before the
   attendee created it by doing the work.
2. **How to break ties on compound complaints**, where a payment failure
   causes a refund delay and the ticket describes both.

Have these two in your pocket. If a room's subagents come back with nothing,
these are the prompts to push on.

## Beat 6 — plugins

Packaged as `.agents/plugins/nussaa-analytics/` with `plugin.json`, `rules/`,
`skills/ticket-themes/` and `mcp_config.json`.

```
agy plugin validate <path>
✔ skills: 1 processed
✔ mcpServers: 1 processed
```

Exit code 0. Run this on the projector — it is the fastest way to make the
bundle concept concrete.

---

## What broke, and what to do about it

### 1. There is no `agy doctor`

The subcommands are `agent`, `agents`, `changelog`, `help`, `install`,
`models`, `plugin`, `plugins`, `update`. Use `agy --version` and `agy models`
as the environment check — the second is better, because it only answers once
sign-in and eligibility are both good.

### 2. Permission denials look like the tool being broken

This CLI does much of its file reading through shell commands, so an
unconfigured machine generates a lot of approval prompts, and a session
waiting on one looks frozen.

Worse, the allow-list matcher works on the **whole command string**. A rule
for `command(ls)` does not approve `pwd && ls -la` or
`find . -type f 2>/dev/null`. Several runs failed this way while the settings
file looked correct.

### 3. Headless mode auto-denies

`agy -p "..."` has nobody to ask, so anything needing an unheld permission is
refused and the run returns no output. Fine once you know; baffling if you do
not. Only relevant if you script it — the workshop itself is interactive.

### 4. What a blocked agent does next — the Beat 6 story

On one run, started **inside** `nussaa/` with `tickets-q1/` present, every read
command was denied by the misconfigured allow-list. After three refusals the
agent stopped trying to read the local folder and instead composed a Python
one-liner to walk `$HOME`, Desktop, Downloads, Documents and several likely
project directories, and separately attempted a machine-wide filename search.

**Both were denied by the permission layer. Nothing outside the workspace was
read.**

This is now the opening demo of Beat 6, told flat: not malice, just an agent
widening its search, with *widening the search* and *leaving the workspace*
being the same action. It is the concrete version of the blast-radius argument
that beat previously made in the abstract.

### 5. Subagents: declare them, do not conjure them

Delegating ad hoc with unusual tool bindings can fail with
`no tool converter registered for <tool>`. A subagent declared in
`.agents/agents/<name>.md` inheriting the standard toolset works. Beat 5 ships
the file to paste.

### 6. Account eligibility is the real Beat 0 risk

Corporate and Workspace Google accounts frequently cannot use the CLI at all —
an admin-controlled setting that cannot be changed in the room. This belongs in
the event comms a week ahead, in bold, not in the Beat 0 troubleshooting list.

---

## Not tested here

- **A full interactive run by an attendee**, with approval prompts, Plan Mode
  and a human reading each step. The lifecycle above was driven efficiently;
  a room of twenty people will be slower and will hit prompts differently.
- **Timings under free-tier quota with twenty concurrent accounts.** Collect
  `/usage` before and after from the first cohort — that number does not exist
  anywhere yet.
- **The global Skills path.** Documentation and codelabs disagree on where a
  user-level Skill goes, and it has moved between releases. Everything in this
  workshop is a project Skill, deliberately. If asked, have people check
  `agy inspect` on their own machine.
