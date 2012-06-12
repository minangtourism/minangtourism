class ChangeColumnUserIdOnTourismArticles < ActiveRecord::Migration
  def up
    remove_column :tourism_articles, :user_id
    add_column :tourism_articles, :user_id, :integer
  end

  def down
    remove_column :tourism_articles, :user_id
    add_column :tourism_articles, :user_id, :string
  end
end
