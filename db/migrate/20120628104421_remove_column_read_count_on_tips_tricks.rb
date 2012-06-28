class RemoveColumnReadCountOnTipsTricks < ActiveRecord::Migration
  def up
    remove_column :tips_tricks, :read_count
  end

  def down
    add_column :tips_tricks, :read_count, :integer
  end
end
