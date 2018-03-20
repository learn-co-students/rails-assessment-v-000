module WorkoutsHelper

  def last_updated(workout)
    workout.updated_at.strftime("Last updated %A, %b %e, at %l:%M %p")
  end

end
