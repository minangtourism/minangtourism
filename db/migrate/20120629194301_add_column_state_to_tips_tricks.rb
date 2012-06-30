class AddColumnStateToTipsTricks < ActiveRecord::Migration
  def up
    add_column :tips_tricks, :state, :string
  end

  def down
    remove_column :tips_tricks, :state
  end
end
