require 'spec_helper'

describe CoursePacksController, :type => :controller do
  render_views

  describe "Create method" do
    before do
      json = { :application => { :name => "foo", :description => "bar" } }    
      request.env['CONTENT_TYPE'] = 'application/json'
      request.env['RAW_POST_DATA'] = json
      post :create
    end

    it "should redirect to '/' on an html request"
       
    end
  end

  describe "try to create and save a new course pack from json request" do 	
  	it "should return a 'conflict http status if fails" do
      respond.status.should eq(403)
  	end

  	it "should respond with an 'ok' request if success" do
      respond.status.should eq(200)
  	end
  end




