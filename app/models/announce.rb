class Announce < ActiveRecord::Base
  belongs_to :bike

  validates :date_in, presence: true
  validates :date_out, presence: true

end
