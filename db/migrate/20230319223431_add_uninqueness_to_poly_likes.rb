class AddUninquenessToPolyLikes < ActiveRecord::Migration[7.0]
  def change
    add_index(:poly_likes, [:user_id, :likeable_type, :likeable_id], unique: true)
  end
end
