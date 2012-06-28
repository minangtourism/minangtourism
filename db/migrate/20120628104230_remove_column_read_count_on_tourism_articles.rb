class RemoveColumnReadCountOnTourismArticles < ActiveRecord::Migration
  def up
    remove_column :tourism_articles, :read_count
  end

  def down
    add_column :tourism_articles, :read_count, :integer
  end
end
