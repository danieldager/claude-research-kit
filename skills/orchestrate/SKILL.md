---
name: orchestrate
description: Run the session in orchestration mode. The main session (the expensive model) only plans, delegates, checks and decides; reading, searching, data work and drafting run in worker subagents on a cheaper model. Use at session start whenever usage limits matter, when a long day of work is ahead, or when the user says "save tokens", "orchestrate", or "use subagents".
---

# Orchestration mode

The main session is the expensive, limited resource. Its job is judgement: what to do next,
in what order, what a result means, what to tell me. Everything else runs in a `worker`
subagent (`~/.claude/agents/worker.md`, cheaper model).

Why this helps:
- **Usage.** Every file the main session reads stays in its context and is re-sent on every
  later turn. A worker reads the 40-page PDF or the long log once, on the cheaper model, and
  hands back ten lines. Workers still count towards usage, and each brief costs some
  overhead, so too many agents can still burn the limit.
- **Parallel work.** Independent tasks (a literature search and a data check) run at the same
  time.
- **A readable conversation.** The main session holds decisions and results, not file dumps,
  so it is easier for me to follow and needs less context management.

## 1. Rules for the main session

- **Announce before launching.** Before each worker, tell me in one or two lines what it is
  for and what it will produce. Wait for my approval unless I already approved that task.
- **Launch only what the next decision needs.** One worker that answers the question in front
  of us beats four that answer questions nobody asked. Never fan out speculatively.
- **One worker per workstream.** Prefer sending a follow-up to a running worker over spawning
  a new one for the same files.
- **Do not do the reading yourself.** At most one or two tiny commands to check state (a file
  exists, a script finished). Anything more is a worker task.
- **Judgement stays here.** Research design, identification arguments, choosing
  specifications, interpreting results, and writing the prompts or code that decide the
  numbers are done or line-reviewed by the main session. Workers do the mechanical work
  around them.
- **Relay, do not re-derive.** When a worker reports, give me the numbers that change a
  decision and a recommendation, in a few lines. Do not quote the report or redo its work.
- **Explain worker jargon.** I never see worker transcripts. Any label or term a worker
  invented must be explained in plain words.
- **Short replies.** Lead with the result.

## 2. Who does what

| task | who |
|---|---|
| literature search and summaries | worker: one per question, returns a table with full citations and a link or page for each claim |
| reading a replication package, codebook or long document | worker: returns a map of the files and where each table or figure is produced |
| data cleaning, merges, checks | worker: writes and runs the script, reports row counts before and after, and the problems found |
| running estimations | worker writes and smoke-tests the code; the main session reviews the specification first |
| drafting text, referee responses | worker drafts to a file; the main session reviews |
| interpreting results, choosing what to run next | main session |

## 3. The brief (every worker, every time)

Workers start with no memory. Each brief includes:

1. Working folder, where to write files, and any cost or time limit.
2. Files to read first (for example `clog/ROADMAP.md` and the latest handoff).
3. The task in one paragraph, including what we already know, so it is not re-derived.
4. The steps in order, with exact commands or scripts where they exist.
5. What to write where: tables and notes to a file, a dated entry in `clog/` for results.
6. "Report back briefly: A, B, C": the three to five things I need.
7. What not to do (do not overwrite the raw data, do not touch files outside the task).

## 4. Long work

- If a worker's context gets long, have it write a handoff file (done, running, next,
  numbers so far) and stop; start a fresh worker from that file.
- When things feel disorganised, list the running agents and stop any whose task is done.
- End of day: `/handoff`.
