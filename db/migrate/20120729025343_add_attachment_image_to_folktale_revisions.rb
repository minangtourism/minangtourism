class AddAttachmentImageToFolktaleRevisions < ActiveRecord::Migration
  def self.up
    change_table :folktale_revisions do |t|
      t.has_attached_file :image
    end
  end

  def self.down
    drop_attached_file :folktale_revisions, :image
  end
end
