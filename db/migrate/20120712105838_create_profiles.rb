class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :sex
      t.date :birthday
      t.text :about
      t.string :email
      t.string :phone
      t.text :address
      t.string :city
      t.string :website
      t.string :facebook
      t.string :twitter

      t.timestamps
    end
  end
end
