class ChangeColumnNameRevisionTypeOnLocationTourismRevision < ActiveRecord::Migration
  def up
    remove_column :location_tourism_revisions, :revisison_type
    add_column :location_tourism_revisions, :revision_type, :string
  end

  def down
    remove_column :location_tourism_revisions, :revisison_type
    add_column :location_tourism_revisions, :revision_type, :string
  end
end
