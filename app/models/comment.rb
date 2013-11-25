class Comment < ActiveRecord::Base
  attr_accessible :comment, :user_id, :course_pack_id
  belongs_to :user
  belongs_to :course_pack

end
