class ChangeColumnNameFromPictureToPhoto < ActiveRecord::Migration
  def change
    remove_column :bikes, :picture
    add_column :bikes, :photo, :string
  end
end
