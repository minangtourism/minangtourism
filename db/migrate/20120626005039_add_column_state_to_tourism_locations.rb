class AddColumnStateToTourismLocations < ActiveRecord::Migration
  def up
    add_column :tourism_locations, :state, :string
    add_column :tourism_locations, :access_state, :string
  end

  def down
    remove_column :tourism_locations, :state
    remove_column :tourism_locations, :access_state
  end
end
