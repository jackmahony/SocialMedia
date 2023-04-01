class AddForeignkeyToPolyLikes < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :poly_likes, :users
  end
end
