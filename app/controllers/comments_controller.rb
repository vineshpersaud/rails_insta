class CommentsController < ApplicationController


    def create
        if current_user.comments.create(comment_params)
            redirect_to posts_post_feed_path
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:text,:post_id)
    end
end