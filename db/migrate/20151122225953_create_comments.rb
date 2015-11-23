class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.datetime :date_of_creation

      t.timestamps null: false
    end
  end
end
