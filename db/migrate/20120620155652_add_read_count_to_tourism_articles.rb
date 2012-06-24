class AddReadCountToTourismArticles < ActiveRecord::Migration
  def change
    add_column :tourism_articles, :read_count, :integer, default: 0
  end
end
