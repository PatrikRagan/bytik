class CreateScrapsites < ActiveRecord::Migration
  def change
    create_table :scrapsites do |t|
      t.boolean :nehnutelnosti
      t.boolean :bazos

      t.timestamps null: false
    end
  end
end
