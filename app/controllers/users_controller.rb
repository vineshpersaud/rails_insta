class UsersController < ApplicationController
  
  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to users_login_path
    end
  end
  
  def signup
    @user = User.new
  end

  def login
    @user = User.new
  end

  def show
  end
  
  def create_session
    if @user = User.find_by_username(params[:user][:username])
      if @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to posts_post_feed_path
      end
    end
  end

  private
    def user_params
      params.require(:user).permit(:username,:password, :password_confirmation,:firstname,:lastname,:email)

    end
end