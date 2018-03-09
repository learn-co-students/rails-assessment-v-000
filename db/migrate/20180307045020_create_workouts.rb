class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :name
      t.integer :duration
      t.string :difficulty
      t.string :training_type
      t.string :website
      t.string :photo
      t.integer :views, default: 0
      t.integer :category_id
      t.integer :user_id
      t.integer :training_type_id

      t.timestamps null: false
    end
  end
end
