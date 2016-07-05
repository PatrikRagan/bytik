class AddForeignKeyOnDeleteFlatCommentCascade < ActiveRecord::Migration
  def change
    # remove the old foreign_key
    remove_foreign_key  :comments, :flats

    # add the new foreign_key
    add_foreign_key :comments, :flats,  on_delete: :cascade
  end
end
