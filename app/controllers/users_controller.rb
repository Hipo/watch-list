class UsersController < ApplicationController

	protect_from_forgery :except => :create 

	def new
	   @user = User.new
	end

	def list
		@users = User.all
		render json: @users
	end

	def create
		@user = User.new(user_param)

		if @user.save
			render json: @user
		else
			# Todo raise exception
		end
   end

   def user_param
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
   end

end
