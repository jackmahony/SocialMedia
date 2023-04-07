class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :likes, as: :likeable
  # after_create_commit { broadcast_append_to "posts" }
end
