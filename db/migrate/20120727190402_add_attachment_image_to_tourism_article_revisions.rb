class AddAttachmentImageToTourismArticleRevisions < ActiveRecord::Migration
  def self.up
    change_table :tourism_article_revisions do |t|
      t.has_attached_file :image
    end
  end

  def self.down
    drop_attached_file :tourism_article_revisions, :image
  end
end
