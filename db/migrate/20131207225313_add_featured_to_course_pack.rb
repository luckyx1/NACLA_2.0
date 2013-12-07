class AddFeaturedToCoursePack < ActiveRecord::Migration
  def change
    add_column :course_packs, :featured, :boolean, :default=>false
  end
end
