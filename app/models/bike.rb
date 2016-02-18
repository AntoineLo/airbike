class Bike < ActiveRecord::Base
  belongs_to :user
  has_many :bookings
  has_many :announces

  has_attachments :photos, maximum: 3

  validates :price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0, :less_than => 100}
  validates :date_in, presence: true
  validates :date_out, presence: true
  validates :address, presence: true
  validates :description, presence: true, length: { maximum: 50 }
  validates :kind, inclusion: { in: %w(VTT Ville Tandem),
    message: "%{value} is not a valid type" }

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

end
