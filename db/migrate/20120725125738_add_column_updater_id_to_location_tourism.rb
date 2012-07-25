class AddColumnUpdaterIdToLocationTourism < ActiveRecord::Migration
  def up
    add_column :location_tourisms, :updater, :integer
  end

  def down
    remove_column :location_tourisms, :updater
  end
end
