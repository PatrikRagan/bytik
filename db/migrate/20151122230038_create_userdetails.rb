class CreateUserdetails < ActiveRecord::Migration
  def change
    create_table :userdetails do |t|
      t.string :nick
      t.boolean :notifications_allowed

      t.timestamps null: false
    end
  end
end
