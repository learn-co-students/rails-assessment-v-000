class AddCommentsToUserTimeSlots < ActiveRecord::Migration[5.2]
  def change
    add_column :user_time_slots, :comments, :string
  end
end
