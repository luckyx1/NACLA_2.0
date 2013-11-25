class Comment < ActiveRecord::Base
  attr_accessible :comment
  belongs_to :user
  belongs_to :course_pack

end
