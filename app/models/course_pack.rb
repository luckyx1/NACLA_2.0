class CoursePack < ActiveRecord::Base
  attr_accessible :title, :summary
  has_and_belongs_to_many :articles
  belongs_to :user

  validates :title, presence:true
  validates :summary, presence:true

end
