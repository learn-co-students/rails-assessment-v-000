class GameSerializer < ActiveModel::Serializer
  attributes :id, :title, :game_system
  has_many :guides
end
