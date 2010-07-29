require 'spec_helper'

describe PostsController do
  def mock_post(stubs={})
    @mock_post ||= mock_model(Post, {
      :to_xml => "XML"
    }.merge(stubs))
  end

  describe "GET index" do
    before(:each) do
      @posts = [mock_post]
      Post.stub(:all).and_return([mock_post])
    end
    
    context "responding to HTML" do
      def do_get
        get :index
      end

      it "assigns all posts as @posts" do
        Post.should_receive(:all).and_return(@posts)
        do_get
        assigns[:posts].should == @posts
      end

      it "renders the index template" do
        do_get
        response.should render_template(:index)
      end
    end
    
    context "responding to XML" do
      def do_get
        request.env["HTTP_ACCEPT"] = "application/xml"
        get :index
      end

      it "renders the @posts XML" do
        do_get
        response.body.should == [mock_post].to_xml
      end
    end
  end

  describe "GET show" do
    it "assigns the requested post as @post" do
      Post.stub(:find).with("37").and_return(mock_post)
      get :show, :id => "37"
      assigns[:post].should equal(mock_post)
    end
  end

  describe "GET new" do
    it "assigns a new post as @post" do
      Post.stub(:new).and_return(mock_post)
      get :new
      assigns[:post].should equal(mock_post)
    end
  end

  describe "GET edit" do
    it "assigns the requested post as @post" do
      Post.stub(:find).with("37").and_return(mock_post)
      get :edit, :id => "37"
      assigns[:post].should equal(mock_post)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created post as @post" do
        Post.stub(:new).with({'these' => 'params'}).and_return(mock_post(:save => true))
        post :create, :post => {:these => 'params'}
        assigns[:post].should equal(mock_post)
      end

      it "redirects to the created post" do
        Post.stub(:new).and_return(mock_post(:save => true))
        post :create, :post => {}
        response.should redirect_to(post_url(mock_post))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved post as @post" do
        Post.stub(:new).with({'these' => 'params'}).and_return(mock_post(:save => false))
        post :create, :post => {:these => 'params'}
        assigns[:post].should equal(mock_post)
      end

      it "re-renders the 'new' template" do
        Post.stub(:new).and_return(mock_post(:save => false))
        post :create, :post => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested post" do
        Post.should_receive(:find).with("37").and_return(mock_post)
        mock_post.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :post => {:these => 'params'}
      end

      it "assigns the requested post as @post" do
        Post.stub(:find).and_return(mock_post(:update_attributes => true))
        put :update, :id => "1"
        assigns[:post].should equal(mock_post)
      end

      it "redirects to the post" do
        Post.stub(:find).and_return(mock_post(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(post_url(mock_post))
      end
    end

    describe "with invalid params" do
      it "updates the requested post" do
        Post.should_receive(:find).with("37").and_return(mock_post)
        mock_post.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :post => {:these => 'params'}
      end

      it "assigns the post as @post" do
        Post.stub(:find).and_return(mock_post(:update_attributes => false))
        put :update, :id => "1"
        assigns[:post].should equal(mock_post)
      end

      it "re-renders the 'edit' template" do
        Post.stub(:find).and_return(mock_post(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested post" do
      Post.should_receive(:find).with("37").and_return(mock_post)
      mock_post.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the posts list" do
      Post.stub(:find).and_return(mock_post(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(posts_url)
    end
  end

end
