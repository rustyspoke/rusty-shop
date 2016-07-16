select
  shifts.id as shift_id,
  visits.id as visit_id

  from shifts, visits

  where arrived_at between beginning_at and ending_at;
