class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :bike

  validates :date_in, presence: true
  validates :date_out, presence: true
  validates :user_id, presence: true
  validates :bike_id, presence: true
  validates :bike_id, uniqueness: { scope: :user_id }
end
