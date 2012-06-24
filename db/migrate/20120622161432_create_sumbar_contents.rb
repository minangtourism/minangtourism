class CreateSumbarContents < ActiveRecord::Migration
  def change
    create_table :sumbar_contents do |t|
      t.string :title
      t.text :content
      t.string :type
      t.integer :user_id

      t.timestamps
    end
  end
end
