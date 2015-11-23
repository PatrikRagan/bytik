class AddUserToUserdetail < ActiveRecord::Migration
  def change
    add_reference :userdetails, :user, index: true, foreign_key: true
  end
end
