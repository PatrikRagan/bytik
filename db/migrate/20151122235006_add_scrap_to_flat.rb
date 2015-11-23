class AddScrapToFlat < ActiveRecord::Migration
  def change
    add_reference :flats, :scrap, index: true, foreign_key: true
  end
end
