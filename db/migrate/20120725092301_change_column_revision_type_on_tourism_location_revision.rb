class ChangeColumnRevisionTypeOnTourismLocationRevision < ActiveRecord::Migration
  def up
    remove_column :tourism_location_revisions, :revision_type
    add_column :tourism_location_revisions, :revisiontable_type, :string
  end

  def down
    remove_column :tourism_location_revisions, :revision_type
    add_column :tourism_location_revisions, :revisiontable_type, :string
  end
end
