class DropRate < ActiveRecord::Migration
  def up
    drop_table :rates
  end

  def down
  end
end
