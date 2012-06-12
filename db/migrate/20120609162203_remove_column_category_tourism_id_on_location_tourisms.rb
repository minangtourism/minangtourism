class RemoveColumnCategoryTourismIdOnLocationTourisms < ActiveRecord::Migration
  def up
    remove_column :location_tourisms, :category_tourism_id
  end

  def down
    add_column :location_tourisms, :category_tourism_id, :integer
  end
end
