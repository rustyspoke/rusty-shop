select
  shifts.id as shift_id,
  visits.id as visit_id

  from shifts, visits

  where (arrived_at, coalesce(departed_at, CURRENT_TIMESTAMP)) overlaps (beginning_at, ending_at);
