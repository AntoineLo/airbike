class CreateAnnounces < ActiveRecord::Migration
  def change
    create_table :announces do |t|
      t.datetime :date_in
      t.datetime :date_out
      t.references :bike, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
