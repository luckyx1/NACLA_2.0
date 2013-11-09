class CoursePack < ActiveRecord::Base
  attr_accessible :title, :summary
  has_and_belongs_to_many :articles

end
