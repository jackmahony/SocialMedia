class RemoveRelationshipsFromLikes < ActiveRecord::Migration[7.0]
  def change
    # remove_foreign_key :likes, column: :user_id
    remove_index :likes, column: :user_id

    # remove_foreign_key :likes, column: :post_id
    remove_index :likes, column: :post_id

    remove_column(:likes, :like)
    remove_column(:likes, :user_id)
    remove_column(:likes, :post_id)
  end
end
