class AddReadCountToTipsTricks < ActiveRecord::Migration
  def change
    add_column :tips_tricks, :read_count, :integer, :default => 0
  end
end
