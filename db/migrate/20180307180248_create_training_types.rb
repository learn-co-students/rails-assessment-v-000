class CreateTrainingTypes < ActiveRecord::Migration
  def change
    create_table :training_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
