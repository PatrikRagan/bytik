class CreateFlats < ActiveRecord::Migration
  def change
    create_table :flats do |t|
      t.string :name
      t.text :content
      t.string :price
      t.datetime :date
      t.integer :room
      t.string :date_of_creation

      t.timestamps null: false
    end
  end
end
