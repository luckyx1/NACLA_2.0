require 'spec_helper'

describe User do
  describe "username should be unique" do
  	it "should create an account when the username is unique" do
  		User.create(username: 'Alex', email: 'alex@test.com',
  			password: 'password', password_confirmation: 'password').
  			should == true
  		
  	end
  	
  	it "should not create an account when the username is not unique" do
  		User.create(username: 'Alex', email: 'alex@test.com',
  			password: 'password', password_confirmation: 'password')
  		User.create(username: 'Alex', email: 'alex2@test.com',
  			password: 'pass', password_confirmation: 'pass').
  			should == false
  	end
  end
  
  describe "email should be unique" do
  	it "should create an account when the email is unique" do
  		User.create(username: 'Alex', email: 'alex@test.com',
  			password: 'password', password_confirmation: 'password').
  			should == true
  		
  	end
  	
  	it "should not create an account when the email is not unique" do
  		User.create(username: 'Alex', email: 'alex@test.com',
  			password: 'password', password_confirmation: 'password')
  		User.create(username: 'Hi', email: 'alex@test.com',
  			password: 'pass', password_confirmation: 'pass').
  			should == false
  	end
  end
  
  describe "passwords should match" do
  	it "should create an account when the passwords match" do
  		User.create(username: 'Alex', email: 'alex@test.com',
  			password: 'password', password_confirmation: 'password').
  			should == true
  		
  	end
  	
  	it "should not create an account when the passwords don't match" do
  		User.create(username: 'Alex', email: 'alex@test.com',
  			password: 'password', password_confirmation: 'pass').
  			should == false
  	end
  end
end
