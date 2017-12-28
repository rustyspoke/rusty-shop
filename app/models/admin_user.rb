class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  has_and_belongs_to_many :shifts

  before_validation do
    self.password ||= 'password'
  end

  scope :hidden, -> { where hidden: true }
  scope :active, -> { where hidden: false }
end
