class UsersController < ApplicationController
  
  def create
  end
  
  def signup
    @user = User.new
  end

  def login
  end

  private
    def user_params
      params.require(:user).permit(:username,:password, :password_confirmation,:firstname,:lastname,:email)

    end
end