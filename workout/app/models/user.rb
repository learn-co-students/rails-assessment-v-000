class User < ApplicationRecord
  validates :name, :presence => true
  validates :name, :uniqueness => true
  validates :password_digest, :presence => true
  validates :password_digest, :uniqueness => true
  has_secure_password
  
  has_many :user_posts
  has_many :posts, through: :user_posts
end
