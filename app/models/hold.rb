class Hold < ActiveRecord::Base
  belongs_to :customer
  has_paper_trail

  def still_held?
    claimed_at.nil? && released_at.nil?
  end
end
