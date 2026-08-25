---
name: travel-todo-finder
description: Find TODO items marked with emoji in provided travel note files, especially Obsidian/Markdown notes under a Travel folder. Use when Codex is asked to inspect only the travel notes or files supplied by the user, check itinerary content for emoji-marked TODOs, and list each file with the matching TODOs.
---

# Travel TODO Finder

## Overview

Scan only the travel note files provided by the user and report TODO items that are explicitly marked with the currently supported emoji markers. Keep the output grouped by file so the user can act on each note directly.

## Workflow

1. Identify the exact files the user provided or referenced.
2. If the user references a Travel folder, search within that folder only for the provided files or clearly relevant supplied note set.
3. Read each file as text, preserving enough surrounding line content to understand the TODO.
4. Find TODOs that are marked with these emoji only:
   - `🚨` for unresolved booking, planning, purchase, or other open action items.
   - `🛂` for passport, immigration, visa, or entry-document reminders.
   - Ignore every other emoji for TODO detection, including `⭐️`, `✅`, `📍`, `💵`, `🤿`, `🧺`, and `💇`.
5. Exclude completed/non-TODO items unless the text still clearly says there is a TODO.
6. Capture useful context for each match from nearby headings and itinerary parents, such as country, month, city, travel day, or activity grouping. For example, if a line says `["O" by Cirque du Soleil] 🚨` under `24. Transit to Las Vegas` and `The Strip at Night`, report that the TODO is in Las Vegas.
7. Report every checked file, even if no TODOs are found.

## File Scope

Do not scan unrelated files. If the user says "provided files," limit work to those files even when neighboring files exist in the Travel folder.

If the user does not identify specific files and only says the travel notes are in a Travel folder, ask for the files to check unless the active workspace already makes the intended file set unambiguous.

## Reporting Format

Use a concise file-by-file report:

```markdown
**<file path>**
- Line <n> (<context>): <TODO text>
- Line <n> (<context>): <TODO text>

**<file path>**
- No emoji-marked TODOs found.
```

Keep context concise and factual. Prefer itinerary context from the nearest parent list item or heading over broad guesses. When the line alone is ambiguous, include a short note after the item explaining why it was treated as a TODO. Do not rewrite the travel notes unless the user explicitly asks.
