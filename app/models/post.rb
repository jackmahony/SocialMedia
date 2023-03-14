class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_create_commit { broadcast_append_to "posts" }


  
end
