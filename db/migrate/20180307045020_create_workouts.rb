class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :name
      t.string :duration
      t.string :difficulty
      t.string :training_type
      t.string :equipment_needed
      t.string :website
      t.string :photo
      t.integer :category_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
