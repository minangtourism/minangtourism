class AddColumnLocationTourismIdToLocationTourismRevisions < ActiveRecord::Migration
  def up
    add_column :location_tourism_revisions, :location_tourism_id, :integer
  end

  def down
    remove_column :location_tourism_revisions, :location_tourism_id
  end
end
