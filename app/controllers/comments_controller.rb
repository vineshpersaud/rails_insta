class CommentsController < ApplicationController


    def create
        binding.pry
    end

    private

    def comment_params
        params.require(:comment).permit(:text,:post_id)
    end
end