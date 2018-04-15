class Game < ApplicationRecord
  has_many :guides
  has_many :users, through: :guides
  validates :title, presence: true
  validates :game_system, presence: true
  validate :unique_game

  def unique_game
    if Game.find_by(params[:title]) && Game.find_by(params[:game_system])
      errors.add(:title, "already exists in the database")
    end
  end

end
