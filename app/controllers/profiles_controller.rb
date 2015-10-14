class ProfilesController < ApplicationController

  before_action :authenticate_user!, only: [:show]
  
  before_action do 
    @user = User.find(params[:user_id])
  end

 	def new
		 
		@profile = @user.build_profile
	end

	def create
		 
		@profile = @user.build_profile(profile_params)
		@profile.save

		redirect_to @user
	end
    
    def show
    end
    
    def edit
    	 
		@profile = Profile.find(params[:id])
    end

    def update
    	 
    	@profile = @user.profile
    	@profile.update(profile_params)

    	redirect_to @user
    end

   private
   def profile_params
   	   params.require(:profile).permit(:uname, :about, :website)
   end
end


