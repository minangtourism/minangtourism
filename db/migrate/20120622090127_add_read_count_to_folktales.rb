class AddReadCountToFolktales < ActiveRecord::Migration
  def change
    add_column :folktales, :read_count, :integer, :default => 0
  end
end
