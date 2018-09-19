class User < ApplicationRecord
  has_many :goals
  has_many :posts, through: :goals
  has_secure_password
end
