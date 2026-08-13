import sqlite3
import csv

conn = sqlite3.connect("practice.db")
cur = conn.cursor()

cur.execute("DROP TABLE IF EXISTS raw_screens")
cur.execute("""
    CREATE TABLE raw_screens (
        session_id TEXT,
        occurred_at TEXT,
        screen_name TEXT,
        university_code TEXT
    )
""")

with open("raw_screens_data.csv") as f:
    reader = csv.reader(f)
    next(reader)
    rows = list(reader)

cur.executemany("INSERT INTO raw_screens VALUES (?,?,?,?)", rows)
conn.commit()
print("Loaded", cur.execute("SELECT COUNT(*) FROM raw_screens").fetchone()[0], "rows")
conn.close()