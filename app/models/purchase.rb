class Purchase < ActiveRecord::Base
  belongs_to :customer

  def self.total_cost
    sum('extract(epoch from cost)').to_f.seconds
  end
end
