class CommentAssociation < ActiveRecord::Migration
  def up
      add_column :course_packs, :comments, :text
  end

  def down
    remove_column :course_packs, :comments
  end
end
