class AddColumnCityNotNullScrap < ActiveRecord::Migration
  def change
    change_column :scraps, :city, :string, null: false
  end
end
