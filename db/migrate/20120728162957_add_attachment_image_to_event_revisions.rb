class AddAttachmentImageToEventRevisions < ActiveRecord::Migration
  def self.up
    change_table :event_revisions do |t|
      t.has_attached_file :image
    end
  end

  def self.down
    drop_attached_file :event_revisions, :image
  end
end
