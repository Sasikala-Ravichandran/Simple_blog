class CommentsController < ApplicationController
	before_action :authenticate_user!

  	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.build(comment_params)
		@comment.user_id = current_user.id
		@comment.save
         
        redirect_to ([@post.user, @post])
	end

    def edit
    	@post = Post.find(params[:post_id])
    	@comment =Comment.find(params[:id])
    end

    def update
    	 @post = Post.find(params[:post_id])
    	 @comment = Comment.find(params[:id])
    	 @comment.update(comment_params)

    	 redirect_to [current_user, @post]
    end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
		@post.comments.destroy(@comment)

        redirect_to user_post_path(current_user, @post)
	end

	private

	def comment_params
		params.require(:comment).permit(:body)
	end
end
