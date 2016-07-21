class ChangeColumOfFlat < ActiveRecord::Migration
  def change
    change_column :flats, :price, 'integer USING CAST(price AS integer)'
  end
end
