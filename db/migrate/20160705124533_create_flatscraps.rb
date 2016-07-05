class CreateFlatscraps < ActiveRecord::Migration
  def change
    create_table :flatscraps do |t|
      t.integer :flat_id
      t.integer :scrap_id
      t.boolean :favourite

      t.timestamps null: false
    end
  end
end
