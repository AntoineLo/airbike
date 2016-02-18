class Bike < ActiveRecord::Base
  belongs_to :user
  has_many :bookings
  has_many :announces

  has_attachments :photos, maximum: 1

  validates :address, presence: true
  validates :description, presence: true, length: { maximum: 50 }
  validates :kind, inclusion: { in: %w(VTT ville tandem),
    message: "%{value} is not a valid type" }

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

end
