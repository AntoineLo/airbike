class ChangeDatetype < ActiveRecord::Migration
  def change
    remove_column :bikes, :date_in
    add_column :bikes, :date_in , :date

    remove_column :bikes, :date_out
    add_column :bikes, :date_out , :date

    # Bike.find_each do |bike|
    #   bike.update(date_in: Date.today, date_out: Date.today + 10)
    # end
  end
end
