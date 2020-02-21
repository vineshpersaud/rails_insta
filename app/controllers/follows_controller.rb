class FollowsController < ApplicationController
  
    def create
        user = User.find_by_id(session[:user_id])
        follow = Follow.new
        follow.follower_id = user.id
        follow.followed_user_id = params['user_id']
        if follow.save
            redirect_to users_find_path
        end
    end


end
  