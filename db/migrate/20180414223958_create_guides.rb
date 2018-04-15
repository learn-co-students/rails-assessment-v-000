class CreateGuides < ActiveRecord::Migration[5.1]
  def change
    create_table :guides do |t|
      t.string :title
      t.integer :user_id
      t.integer :game_id
      t.string :body

      t.timestamps
    end
  end
end
