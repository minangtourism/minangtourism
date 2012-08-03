class RemoveColumnCategoryTourismIdOnTourismLocations < ActiveRecord::Migration
  def up
    remove_column :tourism_locations, :category_tourism_id
  end

  def down
    add_column :tourism_locations, :category_tourism_id, :integer
  end
end
