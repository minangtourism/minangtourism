class RemoveColumnReadCountOnFolktales < ActiveRecord::Migration
  def up
    remove_column :folktales, :read_count
  end

  def down
    add_column :folktales, :read_count, :integer
  end
end
