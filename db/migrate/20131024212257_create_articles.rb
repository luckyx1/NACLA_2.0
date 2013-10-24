class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.datetime :publication_date
      t.text :tags

      t.timestamps
    end
  end
end
