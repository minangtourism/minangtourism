class CreateFolktaleRevisions < ActiveRecord::Migration
  def change
    create_table :folktale_revisions do |t|
      t.string :title
      t.text :description
      t.string :state
      t.integer :user_id
      t.integer :folktale_id

      t.timestamps
    end
  end
end
