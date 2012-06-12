class AddUserIdToTourismArticle < ActiveRecord::Migration
  def change
    add_column :tourism_articles, :user_id, :string
  end
  
end
