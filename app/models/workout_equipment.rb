class WorkoutEquipment < ActiveRecord::Base
  belongs_to :equipment
  belongs_to :workout

end
