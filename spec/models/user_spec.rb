require 'spec_helper'

describe User do
  describe "username" do
  	it "should create an account when the username is unique" do
  		User.create!(username: 'Alex', email: 'alex@test.com',
  			password: 'password', password_confirmation: 'password').
  			should == User.find_by_username('Alex')
  		
  	end
  	
  	it "should not create an account when the username is not unique" do
  		User.create!(username: 'Alex', email: 'alex@test.com',
  			password: 'password', password_confirmation: 'password')
  		User.create(username: 'Alex', email: 'alex2@test.com',
  			password: 'pass', password_confirmation: 'pass')
  		User.find_by_email('alex2@test.com').should == nil
  	end
  end
  
  describe "email" do
  	it "should create an account when the email is unique" do
  		User.create!(username: 'Alex', email: 'alex@test.com',
  			password: 'password', password_confirmation: 'password').
  			should == User.find_by_username('Alex')
  		
  	end
  	
  	it "should not create an account when the email is not unique" do
  		User.create!(username: 'Alex', email: 'alex@test.com',
  			password: 'password', password_confirmation: 'password')
  		User.create(username: 'Hi', email: 'alex@test.com',
  			password: 'pass', password_confirmation: 'pass')
  		User.find_by_username('Hi').should == nil
  	end
  end
  
  describe "passwords" do
  	it "should create an account when the passwords match" do
  		User.create(username: 'Alex', email: 'alex@test.com',
  			password: 'password', password_confirmation: 'password').
  			should == User.find_by_username('Alex')
  		
  	end
  	
  	it "should not create an account when the passwords don't match" do
  		User.create(username: 'Alex', email: 'alex@test.com',
  			password: 'password', password_confirmation: 'pass')
  		User.find_by_username('Alex').should == nil
  	end
  end
  
  describe "logging in" do
    it "with a correct username and password should login" do
      @user = User.create!(username: 'Alex', email: 'alex@test.com',
  			password: 'password', password_confirmation: 'password')
  		User.authenticate('Alex', 'password').should == @user
    end
    
    it "with an incorrect username or password should not login" do
      User.create!(username: 'Alex', email: 'alex@test.com',
  			password: 'password', password_confirmation: 'password')
  		User.authenticate('Alex', 'pass').should == nil
    end
  end
  
end
