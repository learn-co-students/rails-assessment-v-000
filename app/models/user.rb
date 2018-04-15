class User < ApplicationRecord
has_many :guides
has_many :games, through: :guides
has_secure_password
validates :user_name, presence: true
validates :user_name, uniqueness: true
validates :password, presence: true

end
