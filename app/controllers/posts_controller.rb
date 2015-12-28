class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def create
    @post = Post.new
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]
    
    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to @post
    else
      flash.now[:alert] = "there was an error saving the post. Please try again."
      render :new
    end
  end

  def new
    @post = Post.new
  end

  def edit
  end
end