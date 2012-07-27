class AddAttachmentImageToTourismArticles < ActiveRecord::Migration
  def self.up
    change_table :tourism_articles do |t|
      t.has_attached_file :image
    end
  end

  def self.down
    drop_attached_file :tourism_articles, :image
  end
end
