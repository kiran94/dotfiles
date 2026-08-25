---
name: pr-change-log
description: Summarize code changes in the current Git branch compared to a base branch, usually origin/main, for pull request descriptions, branch summaries, release notes, or changelogs. Use when the user asks for concise bullets, a Markdown snippet, a PR change log, or a human-written summary of branch changes.
---

# PR Change Log

## Workflow

1. Inspect the working context before summarizing:
   - Run `git status --short --branch`.
   - Compare against the requested base, defaulting to `origin/main` when unspecified.
   - Use `git diff --stat <base>...HEAD`, `git diff --name-only <base>...HEAD`, and targeted `git diff <base>...HEAD -- <paths>` to understand behavior.
   - Use `git log --oneline <base>..HEAD` when commit intent helps clarify the summary.

2. Summarize the actual behavior changes, not only file names.
   - Mention user-facing, operational, infrastructure, CI, API, database, or developer workflow changes when relevant.
   - Collapse tiny implementation details into the broader change they support.
   - Do not include unrelated working-tree changes unless the user explicitly asks for uncommitted changes too.

3. Keep the output concise and human-written.
   - Prefer one short point per meaningful change.
   - Use plain verbs like "Added", "Updated", "Registered", "Set", or "Removed".
   - Use inline code for commands, variables, filenames, provider names, route names, resource names, and other technical identifiers.

## Default Output Style

Always return the change log as a fenced Markdown snippet containing bullet points. Do not return the bullet list outside the fenced block:

```markdown
- Added a manual `deploy` GitHub Actions workflow for `dev`.
- Registered the `kislerdm/neon` Terraform provider and added `neon_org_id`.
- Set VS Code to use `hashicorp.terraform` for Terraform files.
```
