require 'spec_helper'

describe PostsController do
  describe "GET index" do
    def do_get
      get :index
    end
    
    it "is successful" do
      do_get
      response.should be_success
    end
  end
  
  describe "GET new" do
    before(:each) do
      @post = mock_model(Post)
    end
    
    def do_get
      get :new
    end
    
    it "is successful" do
      do_get
      response.should be_success
    end
    
    it "builds a new post and assigns it for the view" do
      Post.should_receive(:new).and_return(@post)
      do_get
      assigns[:post].should == @post
    end
  end
  
  describe "POST create" do
    before(:each) do
      @post = mock_model(Post)
      Post.stub(:new => @post)
    end
    
    def do_post
      post :create, :post => { :title => "A Post", :body => "Blah" }
    end
    
    context "with valid attributes" do
      before(:each) do
        @post.stub(:save => true)
      end
      
      it "builds a new Post with params and assigns it for the view" do
        Post.should_receive(:new).with("title" => "A Post", "body" => "Blah").and_return(@post)
        do_post
        assigns[:post].should == @post
      end
      
      it "saves the post and sets the flash success" do
        @post.should_receive(:save).and_return(true)
        do_post
        flash[:success].should_not be_nil
      end
      
      it "redirects to the Posts index" do
        do_post
        response.should redirect_to(posts_path)
      end
    end
    
    context "with invalid attributes" do
      before(:each) do
        @post.stub(:save => false)
      end
      
      it "builds a new Post with params and assigns it for the view" do
        Post.should_receive(:new).with("title" => "A Post", "body" => "Blah").and_return(@post)
        do_post
        assigns[:post].should == @post
      end
      
      it "fails to save the post and sets the flash error" do
        @post.should_receive(:save).and_return(false)
        do_post
        flash[:error].should_not be_nil
      end
    end
  end
end
