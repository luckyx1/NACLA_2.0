class CreateCoursePacks < ActiveRecord::Migration
  def change
    create_table :course_packs do |t|

      t.timestamps
    end
  end
end
