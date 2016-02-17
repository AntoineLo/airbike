class AddDateFormatInBookingTable < ActiveRecord::Migration
  def change
    add_column :bookings, :date_in, :date
    add_column :bookings, :date_out, :date
  end
end
