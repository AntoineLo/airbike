class ChangeDateFormatInAnnounceTable < ActiveRecord::Migration
  def change
    change_column :announces, :date_in, :date
    change_column :announces, :date_out, :date
  end
end
