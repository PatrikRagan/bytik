class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
      t.integer :suggested_price
      t.text :result

      t.timestamps null: false
    end
  end
end
