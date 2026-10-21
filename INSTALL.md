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

5. **Session-start hook.** Merge the hook in `hook.md` into `~/.claude/settings.json`
   without removing any existing hooks, and check the file is still valid JSON. It loads the
   project roadmap and the latest handoff whenever a session starts, resumes, or is cleared
   or compacted. Tell the user in one sentence that you added it and how to remove it.

6. **Report.** List every file you created or changed. Then tell the user, in four lines,
   how the kit works from now on:
   - Claude keeps `clog/` up to date in every project, and reloads it at each session start.
   - For larger tasks Claude switches to orchestration on its own; saying "orchestrate"
     forces it.
   - Claude writes a handoff when you stop or the session grows long; `/handoff` forces it.
   - Restart Claude Code so the new skills, agents and settings load.
