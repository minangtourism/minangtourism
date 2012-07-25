class ChangeColumnTypeZipOnTourismArticles < ActiveRecord::Migration
  def up
    remove_column :location_tourisms, :zip
    add_column :location_tourisms, :zip, :integer
  end

  def down
    remove_column :location_tourisms, :zip
    add_column :location_tourisms, :zip, :string
  end
end
