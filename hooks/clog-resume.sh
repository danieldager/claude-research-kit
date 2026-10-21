#!/bin/sh
# Prints clog/ROADMAP.md and the live handoff block, if this folder has a clog/.
[ -d clog ] || exit 0
cat clog/ROADMAP.md 2>/dev/null
f=$(grep -l '^## .*HANDOFF$' clog/[0-9]*.md 2>/dev/null | head -1)
[ -n "$f" ] && awk '/^## .*HANDOFF$/{p=1} p' "$f"
exit 0
