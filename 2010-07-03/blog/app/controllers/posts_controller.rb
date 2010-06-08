class PostsController < ApplicationController
  def index
    
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:success] = "Successfully created post."
    else
      flash[:error] = "Failed to create post."
    end
    redirect_to posts_path
  end
end