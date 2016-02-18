class AddPriceToBikes < ActiveRecord::Migration
  def change
    add_column :bikes, :price, :integer
  end
end
