class AddColumnStateToFolktales < ActiveRecord::Migration
  def up
    add_column :folktales, :state, :string
  end

  def down
    remove_column :folktales, :state
  end
end
