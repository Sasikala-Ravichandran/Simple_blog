class PagesController < ApplicationController
	
	before_action :store_return_to, only: [:show]
	def index
		@posts = Post.all

	end
	def show
		@post = Post.find(params[:id])
	end

    def search
    	@text = params[:txt]
		tag = Tag.find_by_name(params[:txt])
        if(tag)
        	unless (tag.posts.count == 0)
           	   
		      @posts = tag.posts
       	   else
       
       	      @posts =  nil
       	  end 
       	else 
       		 
       		@posts = false
       	end
            render 'index'
	end
	 
end
