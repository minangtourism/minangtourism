class CreateTourismArticleRevisions < ActiveRecord::Migration
  def change
    create_table :tourism_article_revisions do |t|
      t.string :title
      t.text :content
      t.string :state
      t.integer :user_id
      t.integer :tourism_article_id

      t.timestamps
    end
  end
end
