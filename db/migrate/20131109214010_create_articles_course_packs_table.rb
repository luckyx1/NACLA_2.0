class CreateArticlesCoursePacksTable < ActiveRecord::Migration
  def change
    create_table :articles_course_packs, id:false do |t|
      t.integer :article_id
      t.integer :course_pack_id
    end
    add_index :articles_course_packs, [:article_id,:course_pack_id]
    add_index :articles_course_packs, :course_pack_id
  end
end
