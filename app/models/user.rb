class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true

  has_many :comments 
  has_many :posts
  has_many :likes

  # has_many :likes

  def like!(post)
    likes << Like.new(post: post)
  end  
end
