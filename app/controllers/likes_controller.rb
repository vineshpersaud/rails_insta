class LikesController < ApplicationController

    def create
        post = Post.find( params['post_id'])
        post.likes.create(user_id: current_user.id)
        binding.pry
        redirect_to posts_post_feed_path
    end

    private
    def user_params
      params.require(:like).permit(:post_id)
    end
end
