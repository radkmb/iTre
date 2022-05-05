class RegistrationsController < Devise::RegistrationsController
	def update
		if @user.update(user_params)
			redirect_to root_path
		else
			render :edit
		end
	end

	private
	
	def user_params
		params.require(:user).permit(:nickname, :email, :profile_image)
	end

	protected

	def update_resource(resource, params)
		resource.update_without_current_password(params)
	end

	def after_update_path_for(resource)
		user_path(resource)
	end
end
