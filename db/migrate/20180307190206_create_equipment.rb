class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
