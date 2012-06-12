class CreateLocationTourisms < ActiveRecord::Migration
  def change
    create_table :location_tourisms do |t|
      t.string :name
      t.text :address
      t.string :city
      t.string :zip
      t.string :phone
      t.string :web
      t.string :facebook
      t.string :twitter
      t.text :hours_description
      t.text :facility
      t.text :description
      t.integer :category_tourism_id
      t.integer :category_loc_tourism_id
      t.integer :user_id

      t.timestamps
    end
  end
end
