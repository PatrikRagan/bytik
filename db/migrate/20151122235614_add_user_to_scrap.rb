class AddUserToScrap < ActiveRecord::Migration
  def change
    add_reference :scraps, :user, index: true, foreign_key: true
  end
end
