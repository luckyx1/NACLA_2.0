class CoursePack < ActiveRecord::Base
  attr_accessible :title, :summary, :articles
  has_and_belongs_to_many :articles
  belongs_to :user
  has_many :comments

  validates :title, presence:true
  validates :summary, presence:true

  def self.search(id_list)
    @course_packs = []
    if not id_list.nil?
      id_list.each do |id|
         @course_packs << CoursePack.find(id)
      end
    else
      @course_packs = CoursePack.all
    end
  end


end
