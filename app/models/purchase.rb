class Purchase < ActiveRecord::Base
  belongs_to :customer
  has_paper_trail

  def self.total_cost
    sum('extract(epoch from cost)').to_f.seconds
  end
end
