class PagesController < ApplicationController
	
	before_action :store_return_to, only: [:show]
	def index
		@posts = Post.all

	end
	def show
		@post = Post.find(params[:id])
	end
	def view
	end
end
