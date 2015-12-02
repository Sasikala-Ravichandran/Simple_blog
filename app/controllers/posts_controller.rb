class PostsController < ApplicationController

	before_action :set_user 
	
	def new
	  @post = @user.posts.build
	end

	def create
      @post = @user.posts.build(post_params)
	  @post.save
      redirect_to @user
	end

    def show
      @post = Post.find(params[:id])
	end

    def edit
      @post = Post.find(params[:id])
    end

    def update
      @post = Post.find(params[:id])
      @post.update(post_params)
      redirect_to ([@user, @post])
    end

    def destroy
      @post = Post.find(params[:id])
      @user.posts.destroy(@post)
      redirect_to @user
    end

	private
      def post_params
		params.require(:post).permit(:title, :body, :tag_list)
	  end

	  def set_user
		@user = User.find(params[:user_id])
	  end
end

