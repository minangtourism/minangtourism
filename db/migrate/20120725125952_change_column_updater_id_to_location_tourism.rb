class ChangeColumnUpdaterIdToLocationTourism < ActiveRecord::Migration
  def up
    remove_column :location_tourisms, :updater
    add_column :location_tourisms, :updater_id, :integer
  end

  def down
    remove_column :location_tourisms, :updater
    add_column :location_tourisms, :updater_id, :integer
  end
end
