class FollowsController < ApplicationController
  
    def create
        user = User.find_by_id(session[:user_id])
        follow = Follow.new
        follow.follower_id = user.id
        follow.followed_user_id = params['user_id']
        follow.save
    end


end
  