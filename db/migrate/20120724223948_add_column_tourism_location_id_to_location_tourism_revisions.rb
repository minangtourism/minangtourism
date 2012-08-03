class AddColumnTourismLocationIdToTourismLocationRevisions < ActiveRecord::Migration
  def up
    add_column :tourism_location_revisions, :tourism_location_id, :integer
  end

  def down
    remove_column :tourism_location_revisions, :tourism_location_id
  end
end
