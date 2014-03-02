class RelationshipsController < ApplicationController
	def create
		@user = User.find(params[:id])
		current_user.coach!(@user)
		redirect_to users_path
	end

	#def destroy
	#	@user = Relationship.find(params[:id]).coach
	#	current_user.unfollow!(@user)
	#	redirect_to @user
	#end
end
