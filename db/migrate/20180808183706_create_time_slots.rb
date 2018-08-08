class CreateTimeSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :time_slots do |t|
      t.datetime :start_time
      t.integer :duration
      t.integer :number_of_volunteers_needed

      t.timestamps
    end
  end
end
