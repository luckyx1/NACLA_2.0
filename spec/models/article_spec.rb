require 'spec_helper'

describe Article do
	describe 'belongs to Course Pack' do
		before do
			@art = Article.create!
		end
		it "should have Course pack method" do
			@art.should respond_to (:course_packs)
		end

	end
end