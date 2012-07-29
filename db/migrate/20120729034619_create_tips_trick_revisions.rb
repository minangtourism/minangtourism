class CreateTipsTrickRevisions < ActiveRecord::Migration
  def change
    create_table :tips_trick_revisions do |t|
      t.string :title
      t.text :description
      t.string :state
      t.integer :user_id
      t.integer :tips_trick_id

      t.timestamps
    end
  end
end
