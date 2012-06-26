class AddColumnStateToLocationTourisms < ActiveRecord::Migration
  def up
    add_column :location_tourisms, :state, :string
    add_column :location_tourisms, :access_state, :string
  end

  def down
    remove_column :location_tourisms, :state
    remove_column :location_tourisms, :access_state
  end
end
