class AddForeignKeyOnDeleteScrapFlatCascade < ActiveRecord::Migration
  def change
    # remove the old foreign_key
    remove_foreign_key :flats, :scraps

    # add the new foreign_key
    add_foreign_key :flats, :scraps, on_delete: :cascade
  end
end
