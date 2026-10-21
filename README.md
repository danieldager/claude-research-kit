# Claude research kit

A small set of Claude Code files for research projects: a project log that Claude keeps
(`clog/`), an end-of-session handoff, and an orchestration mode in which the main session
plans and decides while cheaper worker subagents do the reading and mechanical work.

## Install

In Claude Code, say:

> Install the research kit from github.com/danieldager/claude-research-kit, following its INSTALL.md.

Or copy the files by hand:

| File | Goes to |
|---|---|
| `CLAUDE.md` (the `clog/` section) | append to `~/.claude/CLAUDE.md` |
| `skills/handoff/SKILL.md` | `~/.claude/skills/handoff/SKILL.md` |
| `skills/orchestrate/SKILL.md` | `~/.claude/skills/orchestrate/SKILL.md` |
| `agents/worker.md`, `agents/labeler.md` | `~/.claude/agents/` |
| `hooks/clog-resume.sh` + `hook.md` | `~/.claude/hooks/`, then merge the entry into `~/.claude/settings.json` |

Also recommended: type `/config` and set the output style to Concise.

## Use

Nothing to do after installing. Claude keeps `clog/ROADMAP.md` and a dated daily log in each
project, reloads them at every session start, switches to orchestration for larger tasks,
and writes a handoff when you stop or the session grows long. Say "orchestrate" or type
`/handoff` to force either.

## Cautions

Workers still count towards your usage. Verify every citation and number a worker returns.
Consumer plans may use your data for training if that setting is on; for confidential data
use the API or an institutional plan, and check your data-use agreement.
