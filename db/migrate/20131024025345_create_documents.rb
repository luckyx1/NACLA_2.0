class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :title
      t.text :description
      t.datetime :publication_date
      t.text :tags

      t.timestamps
    end
  end
end
