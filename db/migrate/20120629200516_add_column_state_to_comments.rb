class AddColumnStateToComments < ActiveRecord::Migration
  def up
    add_column :comments, :state, :string
  end

  def down
    remove_column :comments, :state
  end
end
