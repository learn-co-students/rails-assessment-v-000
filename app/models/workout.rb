class Workout < ActiveRecord::Base
    belongs_to :user

    belongs_to :category
    accepts_nested_attributes_for :category

    belongs_to :training_type

    has_many :workout_equipments
    has_many :equipments, through: :workout_equipments
    accepts_nested_attributes_for :equipments, reject_if: :all_blank

    has_many :favorites

    validates :name, :duration, :website, :training_type_name, presence: true

    #default_scope -> { order(created_at: :desc) }
    #this messes up top watched vids on Home page

  def training_type_name=(name)
    training_type = TrainingType.find_or_create_by(name: name)
    self.training_type = training_type
  end

  def training_type_name
    self.try(:training_type).try(:name)
  end

  def equipments_attributes=(equipment_attributes)
   equipment_attributes.values.each do |equipment_attribute|
     if !equipment_attribute==nil
       equipment=Equipment.find_or_create_by(equipment_attribute)
       self.equipments << equipment
     end
   end
 end

  def category_name=(name)
    category = Category.find_or_create_by(name: name)
    self.category = category
  end

  def category_name
    self.try(:category).try(:name)
  end

  def self.by_training_type(training_type_id)
    where(training_type_id: training_type_id)
  end

  def self.by_category(category_id)
    where(category_id: category_id)
  end

  def self.by_difficulty(difficulty)
    where(difficulty: difficulty)
  end

  def self.by_min(min_time)
    where('duration >= ?' , min_time)
  end

  def self.by_max(max_time)
    where('duration <= ?' , max_time)
  end

  def self.add_view(workout)
    workout.views +=1
    workout.save
  end

  def self.top_views
    all.order(views: :DESC).limit(3)
  end

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
