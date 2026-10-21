---
name: handoff
description: Write the current session state into clog/ so the next session can resume cold. Run before /compact, before /clear, at the end of a work session, or whenever the user says "let's pick this up later", "wrap up", "I'm going to clear". Also run proactively when context is getting full.
---

# Handoff

The next session starts with no memory of this one. `clog/` is the only thing that survives.
Write for a competent co-author who has the project folder but was not in the conversation.

## 1. Update `clog/ROADMAP.md`

Rewrite it to reflect reality now, not the plan from the start of the session. One line per
step: `- [x]` done, `- [ ]` open, `→` in progress. If the direction changed this session, say
what changed and why in one line under the list.

## 2. Retire the previous handoff

There is exactly one live handoff at a time. Find any existing `## HH:MM — HANDOFF` heading
in `clog/` and rename it to `## HH:MM — handoff (superseded)`. Never delete it: it records
what was true at that hour.

Because the old block is retired, the new one must carry forward everything still relevant.
Do not write "as before". Restate it.

## 3. Append the new handoff to today's `clog/DDMMYY.md`

```markdown
## HH:MM — HANDOFF

**Doing:** one sentence on what is currently in progress.
**State:** what exists now that did not at the start of the session: files written, data
  built, regressions run, results with sample sizes and specifications, output paths.
**Next:** the exact next action, specific enough to do without asking.
**Open:** questions waiting for my answer, and decisions deliberately postponed.
**Live settings:** everything the next session would otherwise have to guess: data files and
  vintages, sample restrictions, variable definitions, specifications, seeds, model names.
**Ruled out:** approaches tried and rejected, with the reason, so they are not retried.
```

Leave out any line that is genuinely empty. Do not pad. Completeness beats brevity here:
this is the only thing the next session reads.

## 4. Keep the log readable

If today's file is no longer skimmable, compact the earlier entries: drop trivia, merge
entries that tell one story, keep decisions and results word for word.

## 5. Report

Tell me in two lines what was written and where, and confirm it is safe to clear.
