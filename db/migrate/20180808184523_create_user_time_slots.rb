class CreateUserTimeSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :user_time_slots do |t|
      t.integer :user_id
      t.integer :time_slot_id

      t.timestamps
    end
  end
end
