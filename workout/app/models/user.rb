class User < ApplicationRecord
  has_many :goals
  has_many :posts, through: :goals

  add validations

  has_secure_password
end
