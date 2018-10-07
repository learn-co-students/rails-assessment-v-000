class Post < ApplicationRecord
  has_many :users_posts
  has_many :users, through: :users_posts
  belongs_to :user
end
