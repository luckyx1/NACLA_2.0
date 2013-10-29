class CreateCoursePacks < ActiveRecord::Migration
  def change
    create_table :course_packs do |t|
      t.string :title
      t.text :summary
      t.integer :owner_id
      t.text :articles
      t.timestamps
    end
  end
end
