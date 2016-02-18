class RemoveColumnsFromBikes < ActiveRecord::Migration
  def change
    remove_column :bikes, :zip, :integer
    remove_column :bikes, :city, :string
  end
end
