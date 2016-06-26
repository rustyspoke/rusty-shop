class CurrentVisit < Visit

  default_scope { where departed_at: nil }

end
