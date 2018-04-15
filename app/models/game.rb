class Game < ApplicationRecord
  has_many :guides
  has_many :users, through: :guides
end
