# KSA Access Notes

**For attendees in Saudi Arabia getting `agy` signed in.**

Good news first: there is nothing to pay, so there is no card to be declined. The failure mode here is not billing, it is **eligibility**. Different problem, different fixes.

## What has to be true

Three things, all of them about the account rather than the country:

1. **A personal Google account.** Not a work or university-issued Workspace account.
2. **18 or over.** Age-restricted accounts are refused.
3. **A supported country.** Saudi Arabia is supported.

If all three hold and you still cannot sign in, the problem is usually the first one wearing a disguise — plenty of people have a personal-looking Gmail that is actually managed by an organisation.

## The one that catches most people: work accounts

Access to experimental AI developer tooling is an **admin-controlled setting** on Google Workspace domains. In most organisations it is off by default, and nobody has thought about it.

Symptoms: a sign-in that completes and then refuses, or an error mentioning eligibility or availability rather than a password problem.

**This cannot be fixed at the workshop.** It needs someone in your IT department to enable the setting in the admin console, which takes days and a ticket, not minutes and a facilitator.

So:

- **Use a personal Gmail for the session.** Simplest path, works today.
- **If you want it on your work account long-term,** raise the request with IT this week and name the product. Then come to the workshop on your personal account anyway.

This applies to university accounts too. A `@student.university.edu.sa` address is a Workspace account, and it is subject to the same admin setting.

## VPNs

You do not need one — Saudi Arabia is supported. Using one anyway is more likely to cause a problem than solve one, because a sign-in from a country that does not match your account can trip verification.

If you are already on a corporate VPN, try turning it off before you conclude the account is the problem.

## Students

Google periodically runs free AI Pro offers for students in the region, including through KSA university partnerships. If one is live when you read this, it is worth checking whether you qualify — a Pro tier gets a faster quota refresh than the weekly free one.

It is not required for this workshop. Everything here runs on the free Starter Quota.

## What about paying for more quota

You can, and for this workshop you should not. The free tier covers the whole session. If you find yourself wanting more after a few weeks of real use, that is a decision worth making with your own usage data from `/usage` in front of you rather than in advance.

Note that there is no bring-your-own-key option for this CLI, so paying an API bill elsewhere does not translate into quota here.

## Still stuck

If you have tried a personal Gmail with no VPN and it still refuses, send the facilitator the **exact** error text before the workshop, not a description of it. Some of these messages are specific enough to diagnose; "it didn't work" is not.

Bring a laptop anyway. Pairing with a neighbour for the day is a genuine fallback — the deliverable is a `SKILL.md`, and two people can build one.

[← Back to home](index.html)
