class ChangeColumnUpdaterIdToTourismLocation < ActiveRecord::Migration
  def up
    remove_column :tourism_locations, :updater
    add_column :tourism_locations, :updater_id, :integer
  end

  def down
    remove_column :tourism_locations, :updater
    add_column :tourism_locations, :updater_id, :integer
  end
end
