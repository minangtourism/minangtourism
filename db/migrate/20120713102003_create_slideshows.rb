class CreateSlideshows < ActiveRecord::Migration
  def change
    create_table :slideshows do |t|
      t.string :title
      t.text :description
      t.string :state

      t.timestamps
    end
  end
end
