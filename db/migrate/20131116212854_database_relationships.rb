class DatabaseRelationships < ActiveRecord::Migration
  def change
    add_column :course_packs,:user_id,:integer
    add_column :comments, :user_id, :integer
    add_column :comments, :course_pack_id, :integer
  end
end
