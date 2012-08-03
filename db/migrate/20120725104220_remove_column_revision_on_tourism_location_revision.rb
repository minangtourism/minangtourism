class RemoveColumnRevisionOnTourismLocationRevision < ActiveRecord::Migration
  def self.up
    remove_column :tourism_location_revisions, :revisiontable_id
    remove_column :tourism_location_revisions, :revisiontable_type
  end

    def self.down
    add_column :tourism_location_revisions, :revisiontable_id, :integer
    add_column :tourism_location_revisions, :revisiontable_type, :string
  end
end
