class AddColumnWorkToProfile < ActiveRecord::Migration
  def up
    add_column :profiles, :work, :text
  end

  def down
    remove_column :profiles, :work
  end
end
