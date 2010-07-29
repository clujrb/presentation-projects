require 'spec_helper'

describe PostsController do
  mock_models :post
    
  describe :get => :index do
    expects :find,
      :on      => Post,
      :with    => :all,
      :returns => posts_proc
    
    context Mime::HTML do
      should_assign_to :posts, :with => posts_proc
      should_render_template :index
    end
    
    context Mime::XML do
      should_respond_with :success,
        :content_type => Mime::XML,
        :body         => proc { [mock_post].to_xml }
    end
  end
  
  describe :get => :show, :id => "37" do
    expects :find,
      :on      => Post,
      :with    => "37",
      :returns => post_proc
    
    context Mime::HTML do
      should_assign_to :post, :with => post_proc
      should_render_template :show
    end
    
    context Mime::XML do
      should_respond_with :success,
        :content_type => Mime::XML,
        :body         => proc { mock_post.to_xml }
    end
  end
  
  describe :get => :new do
    expects :new,
      :on      => Post,
      :returns => post_proc
    
    context Mime::HTML do
      should_assign_to :post, :with => post_proc
      should_render_template :new
    end
    
    context Mime::XML do
      should_respond_with :success,
        :content_type => Mime::XML,
        :body         => proc { mock_post.to_xml }
    end
  end
  
  describe :post => :create, "post" => {:title => "There is no cake", :body => "The cake is a lie"} do
    expects :new,
      :on      => Post,
      :with    => ["title" => "There is no cake", "body" => "The cake is a lie"],
      :returns => proc { mock_post }
    
    context "with valid attributes" do
      expects :save,
        :on      => post_proc,
        :returns => true
      
      should_set_the_flash :notice, :to => "Post was successfully created." 
      should_redirect_to { post_url(mock_post) }
    end
    
    context "with invalid attributes" do
      expects :save,
        :on      => post_proc,
        :returns => false
      
      should_assign_to :post, :with => post_proc
      should_render_template :new
    end
  end
  
  describe :put => :update, :id => "37" do
    params :post => { :title => "Love that cube" }
    
    expects :find,
      :on      => Post,
      :with    => "37",
      :returns => post_proc  
    
    context "with valid attributes" do
      expects :update_attributes,
        :on      => post_proc,
        :with    => { "title" => "Love that cube" },
        :returns => true
      
      should_set_the_flash :notice, :to => "Post was successfully updated." 
      should_redirect_to { post_url(mock_post) }
    end
    
    context "with invalid attributes" do
      expects :update_attributes,
        :on      => post_proc,
        :with    => { "title" => "Love that cube" },
        :returns => false
      
      should_assign_to :post, :with => post_proc
      should_render_template :edit
    end
  end
  
  def mock_post(stubs={})
    @mock_post ||= mock_model(Post, {
      :to_xml => "<post />"
    }.merge(stubs))
  end
end
