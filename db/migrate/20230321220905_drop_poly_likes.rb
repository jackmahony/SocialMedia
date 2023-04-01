class DropPolyLikes < ActiveRecord::Migration[7.0]
  def up
    drop_table :poly_likes
    drop_table :likes
  end
end
