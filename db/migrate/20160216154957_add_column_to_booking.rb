class AddColumnToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :date_in, :string
    add_column :bookings, :date_out, :string
  end
end
