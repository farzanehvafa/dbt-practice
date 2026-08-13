# dbt Practice Project

A small practice project to understand how dbt turns messy raw data into clean, aggregated "mart" tables — the same pattern used to build the real university downloads mart.

## Pipeline
1. **Seed** — `seeds/raw_download_events.csv`: fake raw event log with intentional duplicate rows
2. **Staging** — `models/stg_download_events.sql`: deduplicates raw events
3. **Mart** — `models/mart_downloads_by_university.sql`: aggregates into daily downloads per university

## Setup
uv sync
uv run dbt seed
uv run dbt run

## Check the result
uv run python -c "
import sqlite3
conn = sqlite3.connect('practice.db')
for row in conn.execute('SELECT * FROM mart_downloads_by_university'):
print(row)
"
