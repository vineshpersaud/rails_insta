class SessionsController < ApplicationController

    def create_session
        if @user = User.find_by_username(params[:user][:username])
            if @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to posts_post_feed_path
            end
        end
    end

end