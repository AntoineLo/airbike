class Bike < ActiveRecord::Base
  belongs_to :user

  validates :address, presence: true
  validates :type, presence: true
  validates :city, presence: true
  validates :type, inclusion: { in: %w(VTT ville tandem),
    message: "%{value} is not a valid type" }
end
