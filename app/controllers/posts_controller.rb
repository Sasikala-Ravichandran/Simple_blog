class PostsController < ApplicationController

	
	def new
		@user = User.find(params[:user_id])
		@post = @user.posts.build
	end

	def create
		@user = User.find(params[:user_id])
		@post = @user.posts.build(post_params)
		@post.save

		redirect_to @user
	end

    def show
		@post = Post.find(params[:id])
	end

    def edit
    	@user = User.find(params[:user_id])
    	@post = Post.find(params[:id])


    end

    def update
    	@user = User.find(params[:user_id])
    	@post = Post.find(params[:id])
        @post.update(post_params)

        redirect_to ([@user, @post])
    end

    def destroy
    	@user = User.find(params[:user_id])
    	@post = Post.find(params[:id])
    	@user.posts.destroy(@post)
       
        redirect_to @user
    end


	private
	def post_params
		params.require(:post).permit(:title, :body)
	end
end

