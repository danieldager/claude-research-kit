# Load the clog automatically at session start

Add this to `~/.claude/settings.json` (merge with any existing `"hooks"` key). Whenever a session starts, resumes, or is cleared or compacted,
every session it prints the roadmap and the live handoff block, wherever it is in `clog/`; Claude
Code adds that output to the session's context. In folders without `clog/` it prints nothing.

```json
{
  "hooks": {
    "SessionStart": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "[ -d clog ] || exit 0; cat clog/ROADMAP.md 2>/dev/null; f=$(grep -l '^## .*HANDOFF$' clog/[0-9]*.md 2>/dev/null | head -1); [ -n \"$f\" ] && awk '/^## .*HANDOFF$/{p=1} p' \"$f\"; exit 0"
          }
        ]
      }
    ]
  }
}
```
