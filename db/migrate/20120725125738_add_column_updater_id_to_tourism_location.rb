class AddColumnUpdaterIdToTourismLocation < ActiveRecord::Migration
  def up
    add_column :tourism_locations, :updater, :integer
  end

  def down
    remove_column :tourism_locations, :updater
  end
end
