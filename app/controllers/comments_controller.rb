class CommentsController < ApplicationController
	 
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.build(comment_params)
		@comment.user_id = current_user.id
		@comment.save
         
        redirect_to user_post_path(current_user, @post)
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
