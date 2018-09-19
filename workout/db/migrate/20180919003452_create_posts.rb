class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :time
      t.integer :reps

      t.timestamps
    end
  end
end
