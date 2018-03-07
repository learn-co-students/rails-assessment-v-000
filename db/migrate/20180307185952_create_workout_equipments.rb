class CreateWorkoutEquipments < ActiveRecord::Migration
  def change
    create_table :workout_equipments do |t|
      t.integer :workout_id
      t.integer :equipment_id

      t.timestamps null: false
    end
  end
end
