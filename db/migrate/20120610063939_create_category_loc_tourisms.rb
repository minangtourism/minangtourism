class CreateCategoryLocTourisms < ActiveRecord::Migration
  def change
    create_table :category_loc_tourisms do |t|
      t.string :name

      t.timestamps
    end
  end
end
