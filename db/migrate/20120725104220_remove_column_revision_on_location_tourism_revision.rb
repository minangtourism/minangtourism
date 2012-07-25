class RemoveColumnRevisionOnLocationTourismRevision < ActiveRecord::Migration
  def self.up
    remove_column :location_tourism_revisions, :revisiontable_id
    remove_column :location_tourism_revisions, :revisiontable_type
  end

    def self.down
    add_column :location_tourism_revisions, :revisiontable_id, :integer
    add_column :location_tourism_revisions, :revisiontable_type, :string
  end
end
