class AddAttachmentImageToFolktales < ActiveRecord::Migration
  def self.up
    add_column :folktales, :image_file_name, :string
    add_column :folktales, :image_content_type, :string
    add_column :folktales, :image_file_size, :integer
    add_column :folktales, :image_updated_at, :datetime
  end

  def self.down
    remove_column :folktales, :image_file_name
    remove_column :folktales, :image_content_type
    remove_column :folktales, :image_file_size
    remove_column :folktales, :image_updated_at
  end
end
