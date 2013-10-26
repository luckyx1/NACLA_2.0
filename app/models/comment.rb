class Article < ActiveRecord::Base
  attr_accessible :comment, :user, :creationdate, :private

end
