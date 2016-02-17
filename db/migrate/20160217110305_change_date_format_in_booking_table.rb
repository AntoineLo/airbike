class ChangeDateFormatInBookingTable < ActiveRecord::Migration
  def change
    remove_column :bookings, :date_in
    remove_column :bookings, :date_out
  end
end
