class Comment < ActiveRecord::Base
  attr_accessor :comment, :user, :privacy, :postdate, :article
end
