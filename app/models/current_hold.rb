class CurrentHold < Hold

  default_scope { where claimed_at: nil, released_at: nil }

end
