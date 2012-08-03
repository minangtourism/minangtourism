class ChangeColumnTypeZipOnTourismArticles < ActiveRecord::Migration
  def up
    remove_column :tourism_locations, :zip
    add_column :tourism_locations, :zip, :integer
  end

  def down
    remove_column :tourism_locations, :zip
    add_column :tourism_locations, :zip, :string
  end
end
