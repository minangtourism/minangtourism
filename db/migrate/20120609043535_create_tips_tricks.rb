class CreateTipsTricks < ActiveRecord::Migration
  def change
    create_table :tips_tricks do |t|
      t.string :title
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
