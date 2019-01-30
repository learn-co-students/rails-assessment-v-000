module TimeSlotsHelper
  def readable_date(time_slot)
    time_slot.start_time.strftime("%B %d, %Y")
  end

  def readable_start_time(time_slot)
    time_slot.start_time.strftime("%I:%M %p")
  end

  def end_time(time_slot)
    time_slot.start_time + (time_slot.duration * 60)
  end

  def readable_end_time(time_slot)
    end_time(time_slot).strftime("%I:%M %p")
  end

  def ordered_time_slots(time_slots)
    time_slots.sort_by(&:start_time)
  end
end
