class AddUseridToPolyLikes < ActiveRecord::Migration[7.0]
  def change
    add_column(:poly_likes, :user_id, :integer)
  end
end
