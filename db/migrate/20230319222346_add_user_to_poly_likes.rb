class AddUserToPolyLikes < ActiveRecord::Migration[7.0]
  def change
    add_index(:poly_likes, :user_id)
  end
end
