class RemoveColumnImageOnTourismArticle < ActiveRecord::Migration
  def self.up
    remove_column :tourism_articles, :image_file_name
    remove_column :tourism_articles, :image_content_type
    remove_column :tourism_articles, :image_file_size
    remove_column :tourism_articles, :image_updated_at
  end

    def self.down
    add_column :tourism_articles, :image_file_name, :string
    add_column :tourism_articles, :image_content_type, :string
    add_column :tourism_articles, :image_file_size, :integer
    add_column :tourism_articles, :image_updated_at, :datetime
  end
end
