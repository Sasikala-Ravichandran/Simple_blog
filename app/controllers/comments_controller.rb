class CommentsController < ApplicationController
	before_action :authenticate_user!
    before_action do 
       @post = Post.find(params[:post_id])
    end
    	
     
  	def create
		
		@comment = @post.comments.build(comment_params)
		@comment.user_id = current_user.id
		@comment.save
         
        redirect_to ([@post.user, @post])
	end

    def edit
     
    	@comment =Comment.find(params[:id])
    end

    def update
    	 
    	 @comment = Comment.find(params[:id])
    	 @comment.update(comment_params)

    	 redirect_to [current_user, @post]
    end

	def destroy
		 
		@comment = Comment.find(params[:id])
		@post.comments.destroy(@comment)

        redirect_to user_post_path(current_user, @post)
	end

	private

	def comment_params
		params.require(:comment).permit(:body)
	end
end
