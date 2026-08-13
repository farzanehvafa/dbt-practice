select distinct
  session_id,
  occurred_at,
  screen_name,
  university_code
from {{ source('raw', 'raw_screens') }}
where university_code != ''