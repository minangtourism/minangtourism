class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :commentable_id
      t.string :commentable_type
      t.integer :user_id

      t.timestamps
    end
  end
end
