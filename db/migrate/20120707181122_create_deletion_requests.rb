class CreateDeletionRequests < ActiveRecord::Migration
  def change
    create_table :deletion_requests do |t|
      t.references :item, polymorphic: true
      t.text :reason
      t.string :state
      t.references :user

      t.timestamps
    end
    add_index :deletion_requests, :item_id
    add_index :deletion_requests, :item_type
    add_index :deletion_requests, :user_id
  end
end
