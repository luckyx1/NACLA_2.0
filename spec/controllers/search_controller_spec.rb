require 'spec_helper'

describe SearchController do

	describe "search index" do
		it "returns http success" do
			get 'index'
			response.should be_success
		end
	end

end
