---
name: travel-equipment-sheet
description: Extract recommended clothing, equipment, passport/swimwear flags, activity dates/durations, and on-day fees from Markdown travel itinerary notes, especially Obsidian notes with GetYourGuide links, then create or update a travel equipment spreadsheet/Google Sheet.
---

# Travel Equipment Sheet

## Use When

Use this skill when the user asks to analyze Markdown travel notes and collect activity provider packing lists, what-to-bring items, passport/swimwear needs, dates, durations, and additional fees into a spreadsheet or Google Sheet.

Typical inputs:
- Obsidian Markdown files under `Travel/Points of Interest/`
- Itinerary bullets with dates as day numbers or explicit date ranges
- GetYourGuide activity links, short `gyg.me` links, booking/confirmation links, or links marked with `✅`

## Workflow

1. Read only the Markdown files the user provides. If they provide a folder, use `rg --files` and then narrow to itinerary notes.
2. Find the itinerary section and extract activity rows:
   - country from the file name
   - activity title from the Markdown link text or provider page title
   - start date from the itinerary bullet/date range
   - start time and duration from the bullet when present, otherwise from provider details
   - end date/time from start plus duration when reliable; otherwise use the date/day span shown in the note
3. For each GetYourGuide activity link, use Chrome when the user requested `@chrome` or when authenticated booking/confirmation pages may matter.
4. On each provider page, extract:
   - `What to bring`
   - `Know before you go`
   - `Includes`
   - `Not included`
   - any text mentioning taxes, entrance fees, tips, ticket fees, cash-only extras, rentals, optional add-ons, or on-day payments
5. Normalize one row per distinct booked activity. Collapse repeated itinerary days into one multi-day row when they reference the same booking/tour.
6. Create or update a spreadsheet with these columns unless the user specifies otherwise:
   - `country`
   - `activity_name`
   - `activity_start_date`
   - `activity_duration`
   - `activity_end_date`
   - `equipment_needed`
   - `passport_needed`
   - `swimwear_needed`
   - `additional_fees`
   - `additional_fee_explained`

## Extraction Rules

- Keep `activity_start_date` and `activity_end_date` as real date-time cells when writing to a spreadsheet. Format as `yyyy-mm-dd hh:mm`.
- If only a date is known, use `00:00` for start and `23:59` for end for full-day activities, and state that assumption briefly.
- Set `passport_needed` to true if the provider or note says passport, passport/ID, original passport, ID card, or equivalent.
- Set `swimwear_needed` to true if the provider or note says swimwear, swimsuit, bathing suit, or swimming gear.
- Remove passport and swimwear references from `equipment_needed` after moving them to boolean columns.
- Keep other equipment as concise semicolon-separated items.
- Keep `cash` in `equipment_needed` if provider says to bring cash, even if fees are also listed.
- Put exact on-day charges in `additional_fees` when available, preserving currencies.
- Use `additional_fee_explained` for context such as why a fee applies, whether it is cash-only, and whether an option affects inclusion.

## Spreadsheet Handling

- For a new Google Sheet, build and verify a local `.xlsx` using the Spreadsheets skill, then import it through the Google Drive spreadsheet import tool as native Google Sheets.
- For an existing Google Sheet, update in place with Google Drive spreadsheet tools. Read back the changed range after writing.
- If appending new countries/notes to an existing sheet, preserve existing columns and sort by `activity_start_date` if requested.
- If creating temporary output files, clean up local `outputs/` artifacts when the user asks.

## Verification

Before finalizing:
- Read back the spreadsheet range that was created or modified.
- Confirm row count, column order, date-time formatting, and boolean columns.
- Mention any assumptions, especially inferred end times or activities with no provider packing list.
