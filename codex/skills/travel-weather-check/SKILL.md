---
name: travel-weather-check
description: Create or update weather summaries for travel itinerary notes, especially Markdown travel notes where an Itinerary section has a date range such as "4th July - 11th July" and numbered day entries such as "5." or "10." Use when Codex is asked to check weather for trips, tours, itinerary stops, packing tips, or to add/update a generic Weather table in a travel note.
---

# Travel Weather Check

## Overview

Use this skill to turn a travel note's itinerary into practical weather and packing guidance. The expected output is either a concise answer or an updated Markdown section named `### Weather`.

## Workflow

1. Read the travel note.
2. Find the itinerary date range, usually near the top of the `### Itinerary` section, such as `4th July - 11th July`.
3. Map numbered itinerary entries to exact dates from that range:
   - `4.` means July 4 when the range month is July.
   - `10.` means July 10.
   - If the range crosses months or is ambiguous, infer carefully from surrounding text and use exact dates in the response.
4. Identify only relevant trip days:
   - Booked tours marked with confirmation/check marks.
   - User-specified tours, destinations, or itinerary line items.
   - Skip generic rest/transit days unless the user asks for them.
5. Expand each trip into weather locations from the itinerary sublist or linked tour details:
   - Use the note's existing nested stops when present.
   - If stops are missing and the user asked for a full trip weather check, inspect linked tour pages or search current route details as needed.
   - Prefer actual activity locations over generic origin cities.
6. Fetch current forecast data for each date/location. Use exact dates, not relative dates, in reasoning and the response.
7. Summarize conditions at trip level:
   - Temperature range.
   - Rain/snow risk and likely timing.
   - Wind/cold/altitude concerns.
   - UV/sun exposure.
   - For long day trips, early starts, late returns, or remote routes, include a power bank and charging cable in packing tips.
8. Add or update a `### Weather` Markdown table, ordered by date.

## Table Format

Use this table shape:

```markdown
### Weather

| Date | Trip | Weather | Packing Tips |
|---|---|---|---|
| **July 5** | **Nazca Lines & Huacachina** | Lima starts cool around **18C**, Ica/Nazca/Huacachina are sunny and dry, warming to ~**27-29C**; very low rain chance. | Sunglasses, sunscreen, hat, water, light jacket for the early pickup/late return, motion sickness tablets for the flight. |
```

Keep rows compact and practical. Use Celsius by default, if the note says Fahrenheit then convert it. Prefer a single row per trip day unless the user asks for detailed stop-by-stop weather.

## Editing Rules

- If a `### Weather` section already exists, update its table instead of creating a duplicate.
- Keep the table chronological by exact date.
- Put the section after `### Food` when present, unless the user requests another location.
- If there is no `### Food` section then place it at the end of the document.
- Do not overwrite unrelated note content.
- Do not add forecast source links to the note unless the user asks; mention sources in the chat response instead.

## Weather Source Guidance

Use current forecast sources. For current weather, browsing or network lookup is required. Good options include:

- Built-in weather tools when they return data.
- Open-Meteo for multi-location forecast tables.
- A direct forecast source such as wttr.in when it returns reliable data.

When using API coordinates, name the stops clearly in your working notes and avoid exposing unnecessary implementation details in the final answer.

When the requested date is too far out and there is no reliable weather data on it yet then please note that.
