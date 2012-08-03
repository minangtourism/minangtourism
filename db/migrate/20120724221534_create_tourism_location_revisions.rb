class CreateTourismLocationRevisions < ActiveRecord::Migration
  def change
    create_table :tourism_location_revisions do |t|
      t.string :name
      t.text :address
      t.string :city
      t.integer :zip
      t.string :phone
      t.string :web
      t.string :facebook
      t.string :twitter
      t.text :hours_description
      t.text :facility
      t.text :description
      t.integer :category_loc_tourism_id
      t.integer :user_id
      t.string :state
      t.integer :revisiontable_id
      t.string :revisison_type

      t.timestamps
    end
  end
end
