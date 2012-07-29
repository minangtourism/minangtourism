class CreateEventRevisions < ActiveRecord::Migration
  def change
    create_table :event_revisions do |t|
      t.string :title
      t.text :description
      t.date :start_date
      t.date :end_date
      t.integer :user_id
      t.string :image
      t.string :state
      t.integer :event_id

      t.timestamps
    end
  end
end
