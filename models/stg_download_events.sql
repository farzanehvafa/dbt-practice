select distinct
  event_id,
  university_code,
  date(occurred_at) as event_date
from {{ ref('raw_download_events') }}