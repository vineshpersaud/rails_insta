class FriendRequestsController < ApplicationController
    # before_action :set_friend_request, except: [ :create]

    def find_friends
        @friends = User.all
    end 

    def create
      friend = User.find(params[:friend_id])
      @friend_request = current_user.friend_requests.new(friend: friend)
  
      if @friend_request.save
        render :show, status: :created, location: @friend_request
      else
        render json: @friend_request.errors, status: :unprocessable_entity
      end
    end

     private
        def friends_params
            params.require(:friend).permit(:id)
        end
    #     def set_friend_request
    #         @friend_request = FriendRequest.find(params[:id])
    #     end
end