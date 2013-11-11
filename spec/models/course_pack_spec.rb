require 'spec_helper'

describe CoursePack do
	describe 'belongs to Article' do
		before do
			@pack = CoursePack.new
		end
		it "should have Article method" do
			@pack.should respond_to (:articles)
		end

	end
end

