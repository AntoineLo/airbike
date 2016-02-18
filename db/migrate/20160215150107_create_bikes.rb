class CreateBikes < ActiveRecord::Migration
  def change
    create_table :bikes do |t|
      t.string :address
      t.string :type
      t.boolean :helmet
      t.text :picture
      t.boolean :baby_seat
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
