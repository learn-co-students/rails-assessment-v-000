class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.boolean :admin, :default => false
      t.boolean :approved, :default => false
      t.string :uid
      t.string :image
      t.string :email
      t.timestamps
    end
  end
end
