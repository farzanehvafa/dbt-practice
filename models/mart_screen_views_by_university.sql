select
  s.university_code,
  u.university_name,
  date(s.occurred_at) as view_date,
  count(*) as screen_views
from {{ ref('stg_screens') }} s
left join {{ ref('stg_universities') }} u
  on s.university_code = u.university_code
group by s.university_code, u.university_name, view_date
order by s.university_code, view_date