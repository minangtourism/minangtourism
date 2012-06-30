class AddColumnStateToTourismArticles < ActiveRecord::Migration
  def up
    add_column :tourism_articles, :state, :string
  end

  def down
    remove_column :tourism_articles, :state
  end
end
