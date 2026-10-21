# Load the clog automatically at session start

Copy `hooks/clog-resume.sh` to `~/.claude/hooks/clog-resume.sh`, then add the entry below to
`~/.claude/settings.json` (merge it with any existing `"hooks"` key; keep other hooks).
Whenever a session starts, resumes, or is cleared or compacted, the script prints the roadmap
and the live handoff block, wherever it is in `clog/`; Claude Code adds that output to the
session's context. In folders without `clog/` it prints nothing.

```json
{
  "hooks": {
    "SessionStart": [
      {
        "hooks": [
          { "type": "command", "command": "sh ~/.claude/hooks/clog-resume.sh" }
        ]
      }
    ]
  }
}
```

To remove it, delete the `"SessionStart"` entry.
