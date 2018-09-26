class User < ApplicationRecord
  has_many :goals
  has_many :posts, through: :goals
  validates :name, :presence => true
  validates :name, :uniqueness => true
  validates :password_digest, :presence => true
  validates :password_digest, :uniqueness => true
  has_secure_password
end
