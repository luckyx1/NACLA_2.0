class Comment < ActiveRecord::Base
  attr_accessible :comment, :user, :privacy, :postdate, :article
end
