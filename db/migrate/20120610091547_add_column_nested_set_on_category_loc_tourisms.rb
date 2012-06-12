class AddColumnNestedSetOnCategoryLocTourisms < ActiveRecord::Migration
  def up
    add_column :category_loc_tourisms, :parent_id, :integer
    add_column :category_loc_tourisms, :lft, :integer
    add_column :category_loc_tourisms, :rgt, :integer
  end

  def down
    remove_column :category_loc_tourisms, :parent_id
    remove_column :category_loc_tourisms, :lft
    remove_column :category_loc_tourisms, :rgt
  end
end
