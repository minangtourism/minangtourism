class AddAttachmentImageToTipsTrickRevisions < ActiveRecord::Migration
  def self.up
    change_table :tips_trick_revisions do |t|
      t.has_attached_file :image
    end
  end

  def self.down
    drop_attached_file :tips_trick_revisions, :image
  end
end
