class UpdateCoursePacks < ActiveRecord::Migration
  def change
    add_column :course_packs, :public, :boolean
    add_column :course_packs, :tags, :text
  end
end
