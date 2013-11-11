require 'spec_helper'

describe CoursePacksController, :type => :controller do
  render_views
    let(:temp) { CoursePack.create }


  describe "Create method" do
    before do
      json = { :application => { :name => "foo", :description => "bar" } }    
      request.env['CONTENT_TYPE'] = 'application/json'
      request.env['RAW_POST_DATA'] = json
      
    end

    it "should redirect to '/' on an html request", :type => :controller do
       #does the post before do what I want? Need to go to office hours..not working out
       :create
    end
  end

  describe "try to create and save a new course pack from json request" do 	
  	it "should return a 'conflict http status if fails" do
     # respond.status.should eq(403) this should pass...
  	end

  	it "should respond with an 'ok' request if success" do
     # respond.status.should eq(200) this should pass..
  	end
  end
end




