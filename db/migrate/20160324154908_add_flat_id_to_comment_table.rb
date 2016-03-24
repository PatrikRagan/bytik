class AddFlatIdToCommentTable < ActiveRecord::Migration
  def change
    add_reference :comments, :flat, index: true, foreign_key: true
  end
end
