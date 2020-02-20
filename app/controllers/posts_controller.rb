class PostsController < ApplicationController
  
  def new
    @post = Post.new
  end

  def create
    user = User.find_by_id(session[:user_id])
    @post = user.posts.create(post_params)
    if @post.save
      redirect_to post_show_path(@post)
    end
  end

  def show
    @post = Post.find(params['id'])
  end

  def my_post
    @user = User.find_by_id(session[:user_id])
  end

  def post_feed
    if session[:user_id]
      @user = User.find_by_id(session[:user_id])
      @posts = (@user.followings.collect{|user| user.posts}).flatten
    end
  end
  private

  def post_params
    params.require(:post).permit(:title,:image)
  end
end
