select
  university_code,
  university_name,
  onboarding_date,
  user_count
from {{ ref('raw_universities') }}