class AddColumnToFlats < ActiveRecord::Migration
  def change
    add_column :flats, :favourite, :boolean
    add_column :flats, :hidden, :boolean
  end
end
