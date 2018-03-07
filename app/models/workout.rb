class Workout < ActiveRecord::Base
    belongs_to :user
    belongs_to :category
    accepts_nested_attributes_for :category
    belongs_to :training_type
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

  def training_type_name=(name)
    training_type = TrainingType.find_or_create_by(name: name)
    self.training_type = training_type
  end

  def training_type_name
    self.try(:training_type).try(:name)
  end

end
