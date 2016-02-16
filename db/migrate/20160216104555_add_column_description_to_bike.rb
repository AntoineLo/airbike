class AddColumnDescriptionToBike < ActiveRecord::Migration
  def change
     add_column :bikes, :description, :text
  end
end
