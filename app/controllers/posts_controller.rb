class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy, :like]
  before_action :owned_post, only: [:edit, :update, :destroy]
  
  def index
    @posts = Post.all.order('created_at DESC').page params[:page]
  end
  
  def new
    @post = current_user.posts.build
  end

  def create
    
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created."
      redirect_to posts_path
    else
      flash.now[:alert] = "Post not created."
      render :new
    end
    
  end

  def show
  end
  
  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Post updated."
      redirect_to @post
    else
      flash.now[:alert] = "Post not updated."
      render :edit
    end
  end

  def destroy
      @post.delete
      flash[:notice] = "Post has been deleted."
      redirect_to root_path
  end
  
  def like
    if @post.liked_by current_user
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    end
  end
  
  private
    def post_params
      params.require(:post).permit(:image, :caption)
    end
    
    def set_post
      @post = Post.find(params[:id])
    end
    
    def owned_post
      unless current_user == @post.user
        flash[:alert] = "This post doesn't belong to you!"
        redirect_to root_path
      end
    end
end
