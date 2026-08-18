# The Free Tier and Your Quota

**You do not need to pay for anything to do this workshop.**

Sign in to `agy` with a personal Google account and you are on the **Antigravity Starter Quota**. That is the free tier, and it is what every beat here was built and tested against.

---

## What you get

Two things are worth understanding, because neither is obvious from the interface.

### 1. There are two separate pools

Your quota is not one number. It is two:

| Pool | Covers |
|---|---|
| **Gemini models** | Gemini Flash and Gemini Pro, at every effort level |
| **Claude and GPT models** | The third-party models offered through the same CLI |

They deplete independently. Burning the Claude pool does not touch the Gemini pool, and vice versa. This is genuinely useful: if one runs low mid-session, switching model family is also switching pool.

### 2. The free tier refreshes weekly

Paid tiers get a shorter refresh cycle. On the free tier, your pools reset **once a week**.

The practical consequence: spend it all on Monday and you are quiet until the reset. Plan a workshop, a hackathon, or a heavy week accordingly.

---

## Check it with `/usage`

Inside a session:

```text
/usage
```

You get a percentage remaining for each pool and the date they reset. That is the whole interface — there is no token counter, no spend dashboard, no invoice.

**Do this at the start and end of today.** The difference is the only honest answer to "what does a session like this cost?", because Google does not publish the underlying numbers. Two or three cohorts of before-and-after readings and you know more than any documentation will tell you.

---

## What we can and cannot tell you

Being straight about this, because vague reassurance is worse than a caveat:

**Verified, on a real free-tier account:**
- The tier is called the Antigravity Starter Quota.
- There are two pools, shown as percentages, with a stated weekly reset date.
- A full run of this workshop's material — 320 tickets, a plan-mode build, a harvest and two cold subagent runs — fits inside it comfortably on Flash-class models.

**Not published anywhere, and not something we will guess at:**
- How many requests or tokens a percentage point represents.
- Whether the allowance varies by region or account age.

If a number matters to your event, measure it with `/usage` on your own account rather than trusting anybody's estimate — including ours.

---

## Choosing a model, and why it matters here

`/model` lists what your account can reach. On the free tier that typically spans several Gemini Flash and Pro variants plus a Claude and a GPT option in the other pool.

Two things to notice:

**Effort is part of the choice.** Thinking models expose an effort setting — low, medium, high. Higher effort is more reasoning and more quota per turn. Today's job is counting and grouping 38KB of text. It does not need your heaviest option on high.

**A model name may embed the effort.** If you are scripting `agy` rather than using the picker, the model string can include the effort level, and passing `--effort` separately to a model that does not support it is an error. Copy the exact string from `agy models`.

---

## What is not available

**There is no bring-your-own-key.** You cannot point this CLI at your own Gemini API key and bill it yourself. If you already have an API key from other work, it does not help you here.

**Workspace and corporate Google accounts usually will not work at all** — that is an eligibility issue, not a quota one. See the [KSA access notes](viewer.html?file=resources/ksa-access.md).

---

## If you run out mid-session

In rough order of usefulness:

1. **Switch model family** — the other pool is untouched.
2. **Drop the effort setting.** Most of today's work does not need a thinking model at high effort.
3. **Stop re-running the whole analysis.** If you are iterating on a Skill, test it on a handful of tickets rather than all 200 each time.
4. **Pair with a neighbour** for the rest of the session. The deliverable is a `SKILL.md`, and two people can build one.

[← Back to home](index.html)
