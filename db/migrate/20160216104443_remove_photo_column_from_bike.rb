class RemovePhotoColumnFromBike < ActiveRecord::Migration
  def change
    remove_column :bikes, :photo
  end
end
