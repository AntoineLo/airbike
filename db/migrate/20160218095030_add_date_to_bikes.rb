class AddDateToBikes < ActiveRecord::Migration
  def change
    add_column :bikes, :date_in, :string
    add_column :bikes, :date_out, :string
  end
end
