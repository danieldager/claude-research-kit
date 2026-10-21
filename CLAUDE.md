# Project memory

Paste this into `~/.claude/CLAUDE.md` (applies to every project) or into a project's own
`CLAUDE.md`.

## clog/

Every project keeps a `clog/` folder: the project's working state, dated, readable by me and
my co-authors, and stored with the project. Treat it as the record a new session resumes
from, not as a diary.

**`clog/ROADMAP.md`**: where the project is going and what is still open. One line per step:
`- [x]` done, `- [ ]` open, `→` in progress. Add steps as they come up and tick them off when
they are done. When the direction changes, update this file *before* telling me about it.
Read it at the start of every session.

**`clog/DDMMYY.md`**: one log file per day, each entry starting with `HH:MM`. Create today's
file before its first entry. Log without being asked:
- decisions and changes of direction, with the reason;
- every estimation, data build or script run: what was run, on which data and sample, with
  which specification, and the headline result;
- data problems found (duplicates, coding errors, merge failures) and how they were handled;
- anything that cost money or a lot of usage.
Do not log small clarifications or trivial edits. When a file gets long, compact it: drop
trivia, merge entries that tell one story, keep decisions and results word for word. It
should be skimmable in 30 seconds.

ROADMAP is where we are going; the daily log is what happened. Run `/handoff` before
`/compact`, `/clear`, or stopping for the day.

At the start of a session, read `clog/ROADMAP.md` and the most recent `## HH:MM — HANDOFF`
block in `clog/`. Ask before re-deriving anything the clog says was already settled.
