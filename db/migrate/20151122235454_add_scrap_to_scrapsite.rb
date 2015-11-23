class AddScrapToScrapsite < ActiveRecord::Migration
  def change
    add_reference :scrapsites, :scrap, index: true, foreign_key: true
  end
end
