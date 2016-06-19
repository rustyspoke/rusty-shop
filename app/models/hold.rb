class Hold < ActiveRecord::Base
  belongs_to :customer
  has_paper_trail
end
