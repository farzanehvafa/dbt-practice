select
  university_code,
  event_date as date,
  count(*) as downloads
from {{ ref('stg_download_events') }}
group by university_code, event_date
order by university_code, event_date