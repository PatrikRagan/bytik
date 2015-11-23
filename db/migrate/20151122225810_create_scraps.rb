class CreateScraps < ActiveRecord::Migration
  def change
    create_table :scraps do |t|
      t.string :city
      t.string :part_of_town
      t.integer :room_count
      t.text :keywords
      t.integer :price_min
      t.integer :price_max
      t.datetime :last_search_time
      t.integer :number_of_results
      t.datetime :time_of_result_expiration

      t.timestamps null: false
    end
  end
end
