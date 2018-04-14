class User < ApplicationRecord
has_many :guides
has_many :games, through: :guides
has_secure_password


end
