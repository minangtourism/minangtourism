class AddColumnStateToEvents < ActiveRecord::Migration
  def up
    add_column :events, :state, :string
  end

  def down
    remove_column :events, :state
  end
end
