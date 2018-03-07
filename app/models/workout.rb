class Workout < ActiveRecord::Base
    belongs_to :user
    validates :name, :duration, :website, presence: true
    default_scope -> { order(created_at: :desc) }

  def assign_photo(training_type)
    case training_type
      when "HIIT"
        "/images/HIIT-Logo.gif"
      when "Strength Training"
        "/images/weight-lifting-1297690_960_720.png"
      when"Pilates"
        "/images/6609676_orig.png"
      when "Cardio"
        "/images/logo-cardio.jpg"
      when "Yoga"
        "/images/yoga-transparent.png"
      when "Low Impact"
        "/images/lowimpact-logo.png"
      else
        "/images/boxing-kickboxing-logo.png"
    end
  end

end
