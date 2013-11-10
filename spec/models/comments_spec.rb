require 'spec_helper'

describe Comment do
	describe 'create a comment' do
		before do
			comment = Hash.new
			comment[:comment] = 'test'
			comment[:user] = 'testuser'
			comment[:privacy] = 'false'
			comment[:postdate] = DateTime.current()
			comment[:article] = 'testarticle'

			Comment.create(comment)
		end
		it{Comment.find(:first, :conditions => {:user => comment[:user], :comment => comment[:comment], :article => comment[:article]}).should eql(Comment.find(:first, :conditions => {:user => comment[:user], :comment => comment[:comment], :article => comment[:article]}))}
	end

	describe 'delete a comment' do
		before do
			comment = Hash.new
			comment[:comment] = 'test'
			comment[:user] = 'testuser'
			comment[:privacy] = 'false'
			comment[:postdate] = DateTime.current()
			comment[:article] = 'testarticle'

			@comment1 = Comment.create(comment)
			@comment1.destroy
		end
		it{{Comment.find(:first, :conditions => {:user => comment[:user], :comment => comment[:comment], :article => comment[:article]}).should eql(nil)}}
	end
end