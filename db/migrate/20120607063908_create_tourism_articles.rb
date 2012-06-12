class CreateTourismArticles < ActiveRecord::Migration
  def change
    create_table :tourism_articles do |t|
      t.string :title
      t.text :content
      t.string :video

      t.timestamps
    end
  end
end
