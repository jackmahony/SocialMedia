class AddPolymorphicToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :imageable, polymorphic: true, index: true
  end
end
