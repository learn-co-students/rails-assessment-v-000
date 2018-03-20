class Category < ActiveRecord::Base
  has_many :workouts
end
