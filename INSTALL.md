# Installing the research kit

Instructions for Claude Code. The user has asked you to install this kit. Follow these steps
in order, and do not change anything outside `~/.claude/`.

1. **Skills.** Copy `skills/handoff/SKILL.md` and `skills/orchestrate/SKILL.md` to
   `~/.claude/skills/handoff/SKILL.md` and `~/.claude/skills/orchestrate/SKILL.md`. If a
   skill with the same name already exists, show the user the difference and ask before
   replacing it.

2. **Agents.** Copy `agents/worker.md` and `agents/labeler.md` to `~/.claude/agents/`. Same
   rule for existing files.

3. **Project log instructions.** Append the contents of `CLAUDE.md` from this kit, from the
   line `## clog/` to the end, to `~/.claude/CLAUDE.md` under a heading `# Project memory`.
   Create the file if it does not exist. Never overwrite or reorder what is already there. If
   it already contains a `clog/` section, ask the user before adding a second one.

4. **Output style.** In `~/.claude/settings.json`, set `"outputStyle": "Concise"`, keeping
   every other setting. If an output style is already set, ask the user first.

5. **Optional hook.** Explain in two sentences what the session-start hook in `hook.md` does
   (it loads the project roadmap and the latest handoff when a session starts). Ask whether
   to add it. If yes, merge it into `~/.claude/settings.json` without removing any existing
   hooks, and check the file is still valid JSON.

6. **Report.** List every file you created or changed. Then tell the user, in four lines,
   how to use the kit:
   - In a project, work as usual; Claude keeps `clog/` up to date.
   - Say "orchestrate" at the start of a long session to delegate work to cheaper workers.
   - Type `/handoff` before clearing the session or stopping for the day.
   - Restart Claude Code so the new skills, agents and settings load.
