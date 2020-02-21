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

  def find
    current_user = User.find(session[:user_id])
    all_users = User.all.select{|user| user.id != session[:user_id]}
    @users = all_users.select { |user| current_user.followings.find_by_id(user.id) == nil}
    @following = all_users.select { |user| current_user.followings.find_by_id(user.id) != nil}
    
  end


  private
    def user_params
      params.require(:user).permit(:username,:password, :password_confirmation,:firstname,:lastname,:email)

    end
end