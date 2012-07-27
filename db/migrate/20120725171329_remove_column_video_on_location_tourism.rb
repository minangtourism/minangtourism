class RemoveColumnVideoOnLocationTourism < ActiveRecord::Migration
  def self.up
    remove_column :tourism_articles, :video
  end

    def self.down
    add_column :tourism_articles, :video, :string
  end
end
