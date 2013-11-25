require 'spec_helper'

describe UsersController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end
	
	describe "GET 'create'" do
		it "returns http success" do
			get 'create' 
			response.should be_success
		end
		
		it "renders new on account creation failure" do
		  User.create!(username: 'Alex', email: 'alex@test.com',
  			password: 'password', password_confirmation: 'password')
  		params = {}
  		params[:user] = {username: 'Alex', email: 'alex@test.com',
  			password: 'password', password_confirmation: 'password'}
  		get 'create'
  		expect(response).to render_template('new')
  	end
  	
	end
	
	describe "delete account"  do
	  it "should delete the account" do
	    @user = User.create!(username: 'Alex', email: 'alex@test.com',
  			password: 'password', password_confirmation: 'password')
  		@user.destroy
  		
  		User.find_by_username('Alex').should == nil
    end
   end
end
