class RenameColumnCommentableIdOnLikes < ActiveRecord::Migration
  def up
    rename_column :likes, :commentable_id, :likeable_id
    rename_column :likes, :commentable_type, :likeable_type
  end

  def down
    rename_column :likes, :likeable_id, :commentable_id
    rename_column :likes, :likeable_type, :commentable_type
  end
end
