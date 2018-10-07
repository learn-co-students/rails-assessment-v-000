class CreateUserPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :user_posts do |t|
      t.belongs_to :user
      t.belongs_to :post

      t.timestamps
    end
  end
end
