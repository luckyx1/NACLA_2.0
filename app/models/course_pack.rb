class CoursePack < ActiveRecord::Base
  attr_accessible :title, :summary
  has_many :articles

end
