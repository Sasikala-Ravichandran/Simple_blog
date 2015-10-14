class PagesController < ApplicationController
	def index
		@posts = Post.all

	end
	def show
		@post = Post.find(params[:id])
	end
	def view
	end
end
