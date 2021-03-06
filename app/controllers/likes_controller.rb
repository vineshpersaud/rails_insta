class LikesController < ApplicationController

    def create
        post = Post.find( params['post_id'])
        liked = current_user.likes.where(post_id: post.id).exists?
        if !liked
          post.likes.create(user_id: current_user.id)
          redirect_to posts_post_feed_path
        end
    end

    private
    def user_params
      params.require(:like).permit(:post_id)
    end
end
