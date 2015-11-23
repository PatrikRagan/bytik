class RenameFLatsCOlumn < ActiveRecord::Migration
  def change
    rename_column :flats, :date, :date_of_scrap
  end
end
