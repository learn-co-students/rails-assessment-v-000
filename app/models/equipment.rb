class Equipment < ActiveRecord::Base
  has_many :workout_equipments
  has_many :workouts, through: :workout_equipments

end
