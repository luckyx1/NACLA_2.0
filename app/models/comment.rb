class Comment < ActiveRecord::Base
  attr_accessible :comment, :user, :privacy, :postdate, :article
  belongs_to :user
  belongs_to :course_pack

end
